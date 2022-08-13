#include "p3200298-p3200043-res.h"

int *seat_plan;
int *row_free_seats;

void *routine(void *custId)
{
    // code
    int id = *(int *)custId;
    seed = argSeed + id;
    struct timespec start, tel_start, tel_end, cash_start, finish;
    // Customer arrival time.
    clock_gettime(CLOCK_REALTIME, &start);

    if (pthread_mutex_lock(&mutex_tel) != 0)
    {
        perror("Failed to lock mutex.\n");
    }
    while (available_tel <= 0)
    {
        pthread_cond_wait(&cond_tel, &mutex_tel);
    }
    --available_tel;
    if (pthread_mutex_unlock(&mutex_tel) != 0)
    {
        perror("Failed to unlock mutex.\n");
    }
    // Customer connected with tel.
    clock_gettime(CLOCK_REALTIME, &tel_start);
    // Generate a value from 0 to 1 and then decide a zone(a or b).
    char r_zone = ((rand_r(&seed) % 100) / 100.0f) < PZONEA ? 'A' : 'B';
    int num_tickets = (rand_r(&seed) % (NSEATHIGH - NSEATLOW + 1) + NSEATLOW);
    // Check seat availability.
    // mutex_zone is used as a local mutex, to keep the code DRY.
    pthread_mutex_t mutex_zone;
    mutex_zone = r_zone == 'A' ? mutex_zoneA : mutex_zoneB;
    if (pthread_mutex_lock(&mutex_zone) != 0)
    {
        perror("Failed to lock mutex.\n");
    }
    // Random time the telephoner needs to check seat availability.
    int r_time_tel = rand_r(&seed) % (TSEATHIGH - TSEATLOW + 1) + TSEATLOW;
    sleep(r_time_tel);
    // Booking.
    // rc is either -1 (failed) or first booked seat of the current booking.

    int rc = booking(r_zone, num_tickets, id, row_free_seats, seat_plan);
    if (rc == -1)
    {
        // Booking failed.
        if (pthread_mutex_lock(&mutex_screen) != 0)
        {
            perror("Failed to lock mutex.\n");
        }
        printf("Κωδικός πελάτη: %d\nΗ κράτηση απέτυχε γιατί δεν υπάρχουν κατάλληλες θέσεις.\n\n", id);
        if (pthread_mutex_unlock(&mutex_screen) != 0)
        {
            perror("Failed to unlock mutex.\n");
        }
        if (pthread_mutex_unlock(&mutex_zone) != 0)
        {
            perror("Failed to unlock mutex.\n");
        }
        if (pthread_mutex_lock(&mutex_tel) != 0)
        {
            perror("Failed to lock mutex.\n");
        }
        ++available_tel;
        if (pthread_mutex_unlock(&mutex_tel) != 0)
        {
            perror("Failed to unlock mutex.\n");
        }
        if (pthread_mutex_lock(&mutex_case1) != 0)
        {
            perror("Failed to lock mutex.\n");
        }
        ++case_not_enough_seats;
        if (pthread_mutex_unlock(&mutex_case1) != 0)
        {
            perror("Failed to unlock mutex.\n");
        }
        pthread_cond_signal(&cond_tel);
        clock_gettime(CLOCK_REALTIME, &finish);
        if (pthread_mutex_lock(&mutex_waiting) != 0)
        {
            perror("Failed to lock mutex.\n");
        }
        total_waiting_time += tel_start.tv_sec - start.tv_sec;
        if (pthread_mutex_unlock(&mutex_waiting) != 0)
        {
            perror("Failed to unlock mutex.\n");
        }
        if (pthread_mutex_lock(&mutex_service) != 0)
        {
            perror("Failed to lock mutex.\n");
        }
        total_service_time += finish.tv_sec - start.tv_sec;
        if (pthread_mutex_unlock(&mutex_service) != 0)
        {
            perror("Failed to unlock mutex.\n");
        }
        pthread_exit(NULL);
    }
    if (pthread_mutex_unlock(&mutex_zone) != 0)
    {
        perror("Failed to unlock mutex.\n");
    }

    if (pthread_mutex_lock(&mutex_tel) != 0)
    {
        perror("Failed to lock mutex.\n");
    }
    ++available_tel;
    if (pthread_mutex_unlock(&mutex_tel) != 0)
    {
        perror("Failed to unlock mutex.\n");
    }
    pthread_cond_signal(&cond_tel);
    clock_gettime(CLOCK_REALTIME, &tel_end);

    // Payment.`

    int cost = get_cost(r_zone, num_tickets);

    if (pthread_mutex_lock(&mutex_cash) != 0)
    {
        perror("Failed to lock mutex.\n");
    }
    while (available_cashiers <= 0)
    {
        pthread_cond_wait(&cond_cashier, &mutex_cash);
    }
    --available_cashiers;
    if (pthread_mutex_unlock(&mutex_cash) != 0)
    {
        perror("Failed to unlock mutex.\n");
    }
    // Evaluate waiting time and add it to total.
    clock_gettime(CLOCK_REALTIME, &cash_start);
    if (pthread_mutex_lock(&mutex_waiting) != 0)
    {
        perror("Failed to lock mutex.\n");
    }
    total_waiting_time += (tel_start.tv_sec - start.tv_sec) + (cash_start.tv_sec - tel_end.tv_sec);
    if (pthread_mutex_unlock(&mutex_waiting) != 0)
    {
        perror("Failed to unlock mutex.\n");
    }

    // Random time the cashier needs to complete the transaction.
    int r_time_cash = rand_r(&seed) % (TCASHHIGH - TCASHLOW + 1) + TCASHLOW;
    sleep(r_time_cash);

    float r_transaction = (rand_r(&seed) % 100) / 100.0f;
    if (r_transaction > PCARDSUCCESS)
    {
        // Transaction failed.
        if (pthread_mutex_lock(&mutex_zone) != 0)
        {
            perror("Failed to lock mutex.\n");
        }
        cancel_booking(rc, num_tickets, row_free_seats, seat_plan);
        pthread_mutex_lock(&mutex_screen);
        printf("Κωδικός πελάτη: %d\nΗ κράτηση απέτυχε γιατί η συναλλαγή με την πιστωτική κάρτα δεν έγινε αποδεκτή.\n\n", id);
        pthread_mutex_unlock(&mutex_screen);
        pthread_mutex_lock(&mutex_case2);
        ++case_failed_transaction;
        pthread_mutex_unlock(&mutex_case2);

        if (pthread_mutex_unlock(&mutex_zone) != 0)
        {
            perror("Failed to unlock mutex.\n");
        }
        if (pthread_mutex_lock(&mutex_cash) != 0)
        {
            perror("Failed to lock mutex.\n");
        }
        ++available_cashiers;
        if (pthread_mutex_unlock(&mutex_cash) != 0)
        {
            perror("Failed to unlock mutex.\n");
        }
        pthread_cond_signal(&cond_cashier);
        clock_gettime(CLOCK_REALTIME, &finish);
        if (pthread_mutex_lock(&mutex_service) != 0)
        {
            perror("Failed to lock mutex.\n");
        }
        total_service_time += (finish.tv_sec - start.tv_sec);
        if (pthread_mutex_unlock(&mutex_service) != 0)
        {
            perror("Failed to unlock mutex.\n");
        }
        pthread_exit(NULL);
    }
    if (pthread_mutex_lock(&mutex_bank) != 0)
    {
        perror("Failed to lock mutex.\n");
    }
    bank_account += cost;
    if (pthread_mutex_unlock(&mutex_bank) != 0)
    {
        perror("Failed to unlock mutex.\n");
    }
    // Message to customer, transaction completed.
    pthread_mutex_lock(&mutex_screen);
    print_booking(id, rc, num_tickets, cost);
    pthread_mutex_unlock(&mutex_screen);
    if (pthread_mutex_lock(&mutex_cash) != 0)
    {
        perror("Failed to lock mutex.\n");
    }
    ++available_cashiers;
    if (pthread_mutex_unlock(&mutex_cash) != 0)
    {
        perror("Failed to unlock mutex.\n");
    }
    pthread_cond_signal(&cond_cashier);
    // Evaluating service time and add it to total.
    clock_gettime(CLOCK_REALTIME, &finish);
    if (pthread_mutex_lock(&mutex_service) != 0)
    {
        perror("Failed to lock mutex.\n");
    }
    total_service_time += finish.tv_sec - start.tv_sec;
    if (pthread_mutex_unlock(&mutex_service) != 0)
    {
        perror("Failed to unlock mutex.\n");
    }
    pthread_exit(NULL);
}

int main(int argc, char *argv[])
{
    if (argc != 3)
    {
        printf("Παρακαλώ δώστε ακριβώς 2 ορίσματα.\n");
        return -1;
    }

    NCUST = atoi(argv[1]);
    argSeed = atoi(argv[2]);
    int custId[NCUST];
    pthread_t threads[NCUST];

    seat_plan = malloc(sizeof(int) * NUMBEROFSEATS);
    row_free_seats = malloc(sizeof(int) * NUMBEROFROWS);

    for (int i = 0; i < NUMBEROFSEATS; ++i)
    {
        seat_plan[i] = -1;
    }
    for (int i = 0; i < NUMBEROFROWS; ++i)
    {
        row_free_seats[i] = NSEAT;
    }

    // Initializes mutexes and conditions.
    initializer();

    for (int i = 0; i < NCUST; i++)
    {
        custId[i] = i + 1;
        // First customer calls at 0. The next calls after a random time.

        if (custId[i] != 1)
        {
            // Generating random time.
            unsigned int random_num = argSeed + i;
            int r_next = rand_r(&random_num) % (TRESHIGH - TRESLOW + 1) + TRESLOW;
            sleep(r_next);
        }

        if (pthread_create(&threads[i], NULL, &routine, &custId[i]) != 0)
        {
            perror("Error at creating thread.\n");
        }
    }

    for (int i = 0; i < NCUST; i++)
    {
        if (pthread_join(threads[i], NULL) != 0)
        {
            perror("Error at joining thread.\n");
        }
    }

    print_plan(seat_plan);
    print_stats(case_not_enough_seats, case_failed_transaction, NCUST);
    destroyer();
    free(seat_plan);
    free(row_free_seats);
    return 0;
}

/*
 *   Checks the availability of each row inside the specified zone,
 *   to find the row that has at least X number of requested seats.
 *
 *   Returns the first booked seat, that is used as a variable later in case of a potential cancelling.
 *   If the booking is not completed then returns the value -1.
 */
int booking(char zone, int seats, int cid, int *free_seats, int *plan)
{
    int start, end;
    if (zone == 'A')
    {
        start = 0;
        end = NZONEA;
    }
    else
    {
        start = NZONEA;
        end = NZONEA + NZONEB;
    }
    for (int i = start; i < end; i++)
    {
        if (free_seats[i] >= seats)
        {
            int s = i * 10;
            int streak = 0;
            for (int j = 0; (j - streak) <= (NSEAT - seats); j++)
            {
                if (plan[s + j] == -1)
                {
                    ++streak;
                }
                else
                {
                    streak = 0;
                }
                if (streak == seats)
                {
                    for (int k = 1; k <= seats; k++)
                    {
                        plan[s + j - seats + k] = cid;
                    }

                    // Subtract the free seats from this row.
                    free_seats[i] -= seats;
                    // This is the first booked seat from the requested amount of seats.
                    return (s + j - seats + 1);
                }
            }
        }
    }
    // Error code -1 is used as return value when the booking isn't achieved.
    return -1;
}

/*
 *   Calcels the booked seats.
 */
void cancel_booking(int starting_seat, int seats, int *free_seats, int *plan)
{
    for (int i = 0; i < seats; i++)
    {
        plan[starting_seat + i] = -1;
    }
    int row = starting_seat / NSEAT;
    free_seats[row] += seats;
}

void print_plan(int *plan)
{
    for (int i = 0; i < NUMBEROFROWS; i++)
    {
        char zone = i < NZONEA ? 'A' : 'B';
        for (int j = 0; j < NSEAT; j++)
        {
            int row = zone == 'A' ? i + 1 : i - NZONEA + 1;
            int seat = j + 1;
            int code = plan[i * NSEAT + j];
            if (code == -1)
                continue;
            printf("Ζώνη %c/ Σειρά %d/ Θέση %d/ Πελάτης %d\n", zone, row, seat, code);
        }
    }
}

void initializer()
{
    pthread_mutex_init(&mutex_tel, NULL);
    pthread_mutex_init(&mutex_cash, NULL);
    pthread_mutex_init(&mutex_bank, NULL);
    pthread_mutex_init(&mutex_zoneA, NULL);
    pthread_mutex_init(&mutex_zoneB, NULL);
    pthread_mutex_init(&mutex_screen, NULL);
    pthread_mutex_init(&mutex_case1, NULL);
    pthread_mutex_init(&mutex_case2, NULL);
    pthread_mutex_init(&mutex_waiting, NULL);
    pthread_mutex_init(&mutex_service, NULL);
    pthread_cond_init(&cond_tel, NULL);
    pthread_cond_init(&cond_cashier, NULL);
}

void destroyer()
{
    pthread_mutex_destroy(&mutex_tel);
    pthread_mutex_destroy(&mutex_cash);
    pthread_mutex_destroy(&mutex_bank);
    pthread_mutex_destroy(&mutex_zoneA);
    pthread_mutex_destroy(&mutex_zoneB);
    pthread_mutex_destroy(&mutex_screen);
    pthread_mutex_destroy(&mutex_case1);
    pthread_mutex_destroy(&mutex_case2);
    pthread_mutex_destroy(&mutex_waiting);
    pthread_mutex_destroy(&mutex_service);
    pthread_cond_destroy(&cond_tel);
    pthread_cond_destroy(&cond_cashier);
}
