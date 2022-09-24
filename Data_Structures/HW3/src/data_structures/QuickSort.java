package data_structures;

public class QuickSort {
    public static <T extends Comparable<T>>void sort(T[] a, int lo, int hi){
        if (hi <= lo) return;
        int j = partition(a,lo,hi);
        sort(a, lo, j-1);
        sort(a, j+1, hi);
    }
    private static <T extends Comparable<T>> int partition(T[] a, int lo, int hi) {
        int i = lo;
        int j = hi+1;
        T v = a[lo];
        while (true){
            while (less(a[++i], v)) if (i == hi) break;
            while (less(v, a[--j])) if (j == lo) break;
            if (i >= j) break;
            exchange(a, i, j);
        }
        exchange(a, lo, j);
        return j;
    }

    private static <T extends Comparable<T>> void exchange(T[] a, int i, int j) {
        T temp = a[i];
        a[i] = a[j];
        a[j] = temp;
    }

    private static <T extends Comparable<T>>boolean less(T a, T b){
        return a.compareTo(b) < 0;
    }


}
