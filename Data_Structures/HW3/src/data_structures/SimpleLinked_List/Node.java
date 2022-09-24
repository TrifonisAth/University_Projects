package data_structures.SimpleLinked_List;

public class Node {
    private final String element;
    private Node next;

    Node(String s){
        element = s;
        next = null;
    }



    public String getElement() { return element; }

    public Node getNext() { return next; }

    public void  setNext(Node newNext) { next = newNext; }



}
