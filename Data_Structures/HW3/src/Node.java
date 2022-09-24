public class Node {
    private String element;
    private Node next;

    Node(String s){
        element = s;
        next = null;
    }


    public String getElement() { return element; }

    public Node getNext() { return next; }

    public void setElement(String newEl) { element = newEl; }

    public void  setNext(Node newNext) { next = newNext; }



}
