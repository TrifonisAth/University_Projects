#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <time.h>

int booking(char zone, int seats, int cid, int *free_seats, int *plan);
void cancel_booking(int rc, int num_tickets, int *free_seats, int *plan);
void print_plan(int *plan);
void initializer();
void destroyer();
void print_stats(int case1, int case2, int customers);

const int NTEL = 3;
const int NCASH = 2;
const int NSEAT = 10;
const int NZONEA = 10;
const int NZONEB = 20;
const double PZONEA = 0.3;
const int CZONEA = 30;
const int CZONEB = 20;
const int NSEATLOW = 1;
const int NSEATHIGH = 5;
const int TRESLOW = 1;
const int TRESHIGH = 5;
const int TSEATLOW = 5;
const int TSEATHIGH = 13;
const int TCASHLOW = 4;
const int TCASHHIGH = 8;
const double PCARDSUCCESS = 0.9;
const int NUMBEROFSEATS = NSEAT * (NZONEA + NZONEB);
const int NUMBEROFROWS = NZONEA + NZONEB;

pthread_mutex_t mutex_tel;
pthread_mutex_t mutex_cash;
pthread_mutex_t mutex_bank;
pthread_mutex_t mutex_zoneA;
pthread_mutex_t mutex_zoneB;
pthread_mutex_t mutex_screen;
pthread_mutex_t mutex_case1;
pthread_mutex_t mutex_case2;
pthread_mutex_t mutex_waiting;
pthread_mutex_t mutex_service;
pthread_cond_t cond_tel;
pthread_cond_t cond_cashier;

unsigned int argSeed;
unsigned int seed;
int available_tel = NTEL;
int available_cashiers = NCASH;
int bank_account = 0;
int NCUST;
int case_not_enough_seats = 0;
int case_failed_transaction = 0;
double total_waiting_time = 0;
double total_service_time = 0;
void print_stats(int case1, int case2, int customers)
{
    float stat1 = 100.0f * case1 / customers;
    float stat2 = 100.0f * case2 / customers;
    float stat3 = 100 - stat1 - stat2;
    double avg_waiting = total_waiting_time / customers;
    double avg_service = total_service_time / customers;
    printf("Συνολικά έσοδα πωλήσεων: %d ευρώ.\n", bank_account);
    printf("\nΣτατιστικά προγράμματος:\n\n");
    printf("Αποτυχία λόγω ανεπαρκών θέσεων: %.2f%%\n", stat1);
    printf("Αποτυχία σφάλματος κατά την πληρωμή: %.2f%%\n", stat2);
    printf("Επιτυχημένες κρατήσεις: %.2f%%\n\n", stat3);
    printf("Μέσος χρόνος αναμονής: %.2fs\n", avg_waiting);
    printf("Μέσος χρόνος εξυπηρέτησης: %.2fs\n", avg_service);
}

/*
 *   Gets the cost for (num) seats in (zone).
 */
int get_cost(char zone, int num)
{
    if (zone == 'A')
    {
        return CZONEA * num;
    }
    return CZONEB * num;
}

void print_booking(int cid, int rc, int seats, int cost)
{
    int row;
    int s = (rc % NSEAT) + 1;
    char zone = rc < NZONEA * NSEAT ? 'A' : 'B';
    if (zone == 'A')
    {
        row = (rc / NSEAT) + 1;
    }
    else
    {
        row = ((rc / NSEAT) + 1) - NZONEA;
    }
    printf("Κωδικός πελάτη: %d\nΗ κράτηση σας ολοκληρώθηκε επιτυχώς.\nΟι θέσεις σας είναι στην ζώνη %c, σειρά %d, αριθμοί: ", cid, zone, row);
    for (int i = 0; i < seats; i++)
    {
        if (i + 1 == seats)
        {
            printf("%d.", s + i);
            break;
        }
        printf("%d, ", s + i);
    }
    printf("\nTο κόστος της συναλλαγής είναι %d€.\n\n", cost);
}
