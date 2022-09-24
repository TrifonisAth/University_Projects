import data_structures.SimpleLinked_List.SinglyLinkedList;
import data_structures.QuickSort;

import java.io.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * This is an AVL BST implementation
 */
public class BST implements WordCounter {

    /**
     * Represents a tree node inside the BST.
     */
    private class TreeNode {
        final WordFreq item;
        TreeNode left, right;       // Pointers to left and right subtree.
        int subtreeSize;            // Number of nodes in subtree starting at this node.
        int height;                 // Height of node.

        TreeNode(String word, int count) {
            item = new WordFreq(word, count);
            subtreeSize = 1;
            height = 0;
            left = null;
            right = null;
        }

        TreeNode(WordFreq word){
            item = word;
            subtreeSize = 1;
            height = 0;
            left = null;
            right = null;
        }

    }

    private TreeNode head;      // Root of the tree.
    private SinglyLinkedList stopWords = new SinglyLinkedList();     // Create list of stop words.
    private int iterator;

    @Override
    public void insert(String word) {
        head = insertR(head, word);
    }

    private TreeNode insertR(TreeNode h, String w) {
        if (h == null) return new TreeNode(w, 1);
        if (less(w, h.item.key()))
            h.left = insertR(h.left, w);
        else if (less(h.item.key(), w)) {
            h.right = insertR(h.right, w);
        } else {
            h.item.increase();              // If the word already exists increase the count by 1.
            return h;
        }
        updateHeight(h);
        updateSize(h);
        return balanceR(h);
    }

    private TreeNode balanceR(TreeNode h) {  // Balances the node by doing rotations.
        if (balanceFactor(h) > 1) {         // The insertion happened to the left child of h.
            if (balanceFactor(h.left) < 0) {
                h.left = rotL(h.left);      // The insertion happened to the right subtree of the left child of h.
            }
            h = rotR(h);
        } else if (balanceFactor(h) < -1) {     // The insertion happened to the right child of h.
            if (balanceFactor(h.right) > 0) {
                h.right = rotR(h.right);        // The insertion happened to the left subtree of the right child of h.
            }
            h = rotL(h);
        }
        return h;
    }

    private int balanceFactor(TreeNode h) {
        return getHeight(h.left) - getHeight(h.right);
    }   // Height difference of the two children of h.


    public WordFreq simpleSearch(String word) {
        return simpleSearchR(head, word);
    }

    private WordFreq simpleSearchR(TreeNode h, String w) {
        if (h == null) return null;
        if (equals(w, h.item.key())) return h.item;
        if (less(w, h.item.key())) return simpleSearchR(h.left, w);
        else return simpleSearchR(h.right, w);
    }

    @Override
    public WordFreq search(String word){
        WordFreq searched = simpleSearchR(head, word);
        if (searched == null) return null;
        if (searched.getCount() > getMeanFrequency()){
            TreeNode h = searchR(head, word);
            if (h != null){
                head = h;
                return head.item;
            }
        }
        return searched;
    }

    private TreeNode searchR(TreeNode h, String w) {
        TreeNode t;
        if (h == null) return null;
        if (equals(h.item.key(), w)) return h;
        if (less(w,h.item.key())){
            t = searchR(h.left, w);
            if (t != null && getMeanFrequency() <= t.item.getCount()){
                h.left = t;
                rotR(h);
            }
        }
        else {
            t = searchR(h.right, w);
            if (t != null && getMeanFrequency() <= t.item.getCount()){
                h.right = t;
                rotL(h);
            }
        }
        return t;
    }



    /**
     * This method removes a TreeNode that is equal to the given string.
     * Also, it is doing a first search to find if the word
     * is inside the tree. If it is not found then it returns immediately.
     * If it is found then a second tree traversal is happening to decrease
     * the subTreeSize.
     * The reason for this implementation is the fact that when the searching
     * is happening recursively we also decrease the subTreeSize of the nodes
     * inside the searching path and that could be a problem if the word was not
     * found in the tree when trying to find and remove it.
     *
     * @param word
     */
    @Override
    public void remove(String word) {
        if (!contains(word)) return;
        head = removeR(head, word);
    }

    /**
     * @param h starting node.
     * @param w word to remove.
     */
    private TreeNode removeR(TreeNode h, String w) {
        if (less(w, h.item.key())) h.left = removeR(h.left, w);
        else if (less(h.item.key(), w)) h.right = removeR(h.right, w);
        else {
            if (h.left == null) return h.right;
            else if (h.right == null) return h.left;
            else {
                TreeNode x = h;
                h = min(x.right);
                h.right = deleteMin(x.right);
                h.left = x.left;
            }
        }
        updateHeight(h);
        updateSize(h);
        return balanceR(h);
    }

    private TreeNode deleteMin(TreeNode h) {
        if (h.left == null) return h.right;
        h.left = deleteMin(h.left);
        updateHeight(h);
        updateSize(h);
        return balanceR(h);
    }

    private TreeNode min(TreeNode h) {
        if (h.left == null) return h;
        return min(h.left);
    }

    private TreeNode max(TreeNode h) {
        if (h.right == null) return h;
        return max(h.right);
    }

    private boolean contains(String w) {
        return simpleSearchR(head, w) != null;
    }

    @Override
    public void load(String filename) {
        try{
            BufferedReader br = new BufferedReader(new FileReader(filename)); // Open file buffer.
            String line;
            if (br.ready()) {          // Check if file isn't empty.
                Matcher m;
                Pattern p = Pattern.compile("[a-zA-Z']+");  // Pattern to get valid words.
                System.out.println("...Start reading.");
                while ((line = br.readLine()) != null) {
                    m = p.matcher(line.toLowerCase());      // Set string to lowercase to achieve case in-sensitive.
                    System.out.println(line);
                    while (m.find()) {
                        if (m.group().startsWith("'") || stopWords.isInsideList(m.group())) {
                            continue;      // Check if the word is valid and is NOT inside the stopWords list.
                        }
                        System.out.println(m.group());
                        insert(m.group());              // Insert word into the tree.
                    }
                }
                System.out.println("...End of reading.");
            }
        } catch (FileNotFoundException e){
            System.out.println("File not found.");
            e.printStackTrace();
        } catch (IOException e){
            System.out.println("Error.");
            e.printStackTrace();
        } catch (IndexOutOfBoundsException e){
            System.out.println("Empty argument.");
            e.printStackTrace();
        }
    }

    @Override
    public int getTotalWords() {
        return traverseRPreOrder(head);
    }

    @Override
    public int getDistinctWords() {
        return getSize(head);
    }

    @Override
    public int getFrequency(String w) {
        WordFreq x =simpleSearch(w);
        if (x == null) return 0;
        return x.getCount();
    }

    @Override
    public WordFreq getMaximumFrequency() {
        WordFreq x = new WordFreq("", 0);
        return findMaxFreq(head, x);
    }

    private WordFreq findMaxFreq(TreeNode h, WordFreq x) {
        if (h == null)
            return x;
        x = h.item;
        WordFreq l = findMaxFreq(h.left, x);
        WordFreq r = findMaxFreq(h.right, x);
        if (l.getCount() > x.getCount())
            x = l;
        if (r.getCount() > x.getCount())
            x = r;
        return x;
    }



    @Override
    public double getMeanFrequency() {
        if (getDistinctWords() == 0) return 0;
        return (1.0 * getTotalWords() / getDistinctWords());
    }

    /**
     * Adds a word inside the linked list stopWords.
     *
     * @param w, word to add.
     */
    @Override
    public void addStopWord(String w) {
        stopWords.insert(w);
    }

    /**
     * Removes a word from the linked list stopWords.
     *
     * @param w, word to remove.
     * @throws Exception
     */
    @Override
    public void removeStopWord(String w) throws Exception {
        stopWords.remove(w);
    }

    /**
     * Prints the words stored inside the tree alphabetically.
     * Uses an in-order recursive traversal.
     */
    @Override
    public void printTreeAlphabetically(PrintStream stream) {
        recursiveInOrder(head);
    }

    @Override
    public void printTreeByFrequency(PrintStream stream) {
        if (head == null) return;
        WordFreq[] arr = new WordFreq[size()];
        iterator = 0;
        fillArray(head, arr);
        QuickSort.sort(arr, 0, arr.length-1);
        for (WordFreq word : arr) {
            System.out.println(word.toString());      // stream.println
        }
    }

    private void fillArray(TreeNode h, WordFreq[] arr){
        if (h == null) return;
        fillArray(h.left, arr);
        arr[iterator] = h.item;
        iterator++;
        fillArray(h.right, arr);
    }


    /**
     * Returns the number of TreeNodes inside the tree
     * by getting the subtreeSize of the head.
     *
     * @return tree size.
     */
    public int size() {
        return getSize(head);
    }

    /**
     * Returns the subtreeSize from the TreeNode h.
     * Examples:
     * -A TreeNode without children has subtreeSize of 1 (itself).
     * -A TreeNode with two children that are leaves has a
     * subtreeSize of 3.
     *
     * @param h TreeNode to get its subtreeSize.
     * @return
     */
    private int getSize(TreeNode h) {
        if (h == null) return 0;
        return h.subtreeSize;
    }

    /**
     * Returns a boolean based in the condition
     * in which the head is null (true) or not (false)
     */
    public boolean isEmpty() {
        return head == null;
    }

    /**
     * Returns the max amount of levels this tree has.
     */
    public int getHeight() {
        return getHeight(head);
    }

    /**
     * Returns the height from the selected TreeNode which is equal
     * to the max path from this node to the leaves of the tree.
     *
     * @param h TreeNode to return its height.
     */
    private int getHeight(TreeNode h) {
        if (h == null) return -1;
        return h.height;
    }

    /**
     * Traverses the tree in-order and prints each element.
     *
     * @param h, a TreeNode.
     */
    private void recursiveInOrder(TreeNode h) {
        if (h == null) return;
        recursiveInOrder(h.left);
        System.out.println(h.item.toString());
        recursiveInOrder(h.right);
    }

    private int traverseRPreOrder(TreeNode h) {
        if (h == null) return 0;
        return h.item.getCount() + traverseRPreOrder(h.left) + traverseRPreOrder(h.right);
    }


    private TreeNode rotR(TreeNode h) {
        TreeNode x = h.left;
        h.left = x.right;
        x.right = h;
        return fix(h, x);
    }

    private TreeNode rotL(TreeNode h) {
        TreeNode x = h.right;
        h.right = x.left;
        x.left = h;
        return fix(h, x);
    }

    private TreeNode fix(TreeNode a, TreeNode b) {
        updateHeight(a);
        updateHeight(b);
        b.subtreeSize = getSize(a);
        updateSize(a);
        return b;
    }

    private void updateHeight(TreeNode h) {
        h.height = 1 + Math.max(getHeight(h.left), getHeight(h.right));
    }

    private void updateSize(TreeNode h) {
        h.subtreeSize = 1 + getSize(h.left) + getSize(h.right);
    }


    private boolean less(String word1, String word2) {
        return word1.compareTo(word2) < 0;
    }

    private boolean equals(String a, String b) {
        return a.compareTo(b) == 0;
    }

    private boolean isAVL(TreeNode x) {
        if (x == null) return true;
        int bf = balanceFactor(x);
        if (bf > 1 || bf < -1) return false;
        return isAVL(x.left) && isAVL(x.right);
    }

    private boolean isAVL() {
        return isAVL(head);
    }

    private boolean isBST() {
        return isBST(head, null, null);
    }

    private boolean isBST(TreeNode h, String min, String max) {
        if (h == null) return true;
        if (max != null && (less(max, h.item.key()) || equals(max, h.item.key()))) return false;
        if (min != null && (less(h.item.key(), min) || equals(min, h.item.key()))) return false;
        return isBST(h.left, min, h.item.key()) && isBST(h.right, h.item.key(), max);
    }

    private boolean isSizeConsistent() {
        return isSizeConsistent(head);
    }

    /**
     * Checks if the size of the subtree is consistent.
     *
     * @return {@code true} if the size of the subtree is consistent
     */
    private boolean isSizeConsistent(TreeNode x) {
        if (x == null) return true;
        if (x.subtreeSize != getSize(x.left) + getSize(x.right) + 1) return false;
        return isSizeConsistent(x.left) && isSizeConsistent(x.right);
    }

    private boolean check() {
        if (isBST() && isAVL() && isSizeConsistent()) {
            System.out.println("The tree is perfect!");
            return true;
        }
        if (!isBST()) System.out.println("Symmetric order is not consistent");
        if (!isAVL()) System.out.println("AVL property is not consistent");
        if (!isSizeConsistent()) System.out.println("SubtreeSize is not consistent");
        System.out.println("The tree is not perfect.");
        return false;
    }


    public static void main(String[] args) throws Exception {


        BST avl = new BST();
        avl.addStopWord("the");
        avl.addStopWord("of");
        avl.addStopWord("and");
        avl.addStopWord("to");
        avl.addStopWord("a");
        avl.addStopWord("in");
        avl.addStopWord("his");
        avl.addStopWord("that");
        avl.addStopWord("he");
        avl.addStopWord("is");
        avl.addStopWord("i");
        avl.addStopWord("was");
        avl.addStopWord("were");
        avl.addStopWord("with");
        avl.addStopWord("by");
        avl.addStopWord("which");
        avl.addStopWord("as");
        avl.addStopWord("it");
        avl.addStopWord("be");
        avl.addStopWord("james");
        avl.removeStopWord("james");

        avl.load("C:\\Users\\thanos\\DS_3RD_BST\\src\\document.txt");
        avl.printTreeByFrequency(new PrintStream(System.out));
        System.out.println(avl.getMaximumFrequency() + " MAX FREQ");
        System.out.println(avl.getMeanFrequency() + " MEAN FREQ");
        System.out.println(avl.getFrequency("james"));
        //System.out.println(avl.head.item.toString() + " THIS IS HEAD");
        //System.out.println(avl.search("james") + "----");
        System.out.println(avl.search("but") + "----");
        //avl.remove("james");
        System.out.println(avl.head.item.toString() + " NEW HEAD");
        //avl.remove("james");
        //avl.printTreeByFrequency(System.out);
        //avl.printTreeAlphabetically(System.out);


        avl.check();
    }
}

