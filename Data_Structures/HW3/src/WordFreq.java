public class WordFreq implements Comparable<WordFreq>{

    final private String word;         // Word.

    private int count;       // Number of appearances.

    public String key() {
        return word;
    }       // Returns the key.
    public int getCount() { return this.count; }

    /**
     * Increases the count of the word by 1.
     */
    public void increase(){
        this.count++;
    }

    public WordFreq(String w, int count){
        this.word = w;
        this.count = count;
    }

    public int compareTo(WordFreq x){
        return this.getCount() - x.getCount();
    }




    @Override
    public String toString() {
        return  key() + ", count = " + count;
    }
}
