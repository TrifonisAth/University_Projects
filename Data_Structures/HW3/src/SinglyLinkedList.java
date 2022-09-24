import java.util.NoSuchElementException;

public class SinglyLinkedList {
    protected Node head;
    protected long size;

    public SinglyLinkedList(){
        head = null;
        size = 0;
    }

    public void insert(String str) {
        Node newNode = new Node(str);
        if (this.head != null) {    // If list isn't empty set the old head as next.
            newNode.setNext(head);
        }
        this.head = newNode;        // Make the new node head.
        size++;
    }

    public void remove(String str) {
        if (this.head == null) throw new NoSuchElementException("The list is empty!");
        if (head.getElement().equals(str)){
            removeHead();
            return;
        }
        Node cur = head.getNext();
        Node prev = head;
        while(cur != null){
            if (cur.getElement().equals(str)){      // When the element is found, the previous node gets to point the current's node next.
                prev = cur.getNext();
                System.out.println("The word: " + cur.getElement() + " is removed.");
                size--;
                return;
            }
            prev = cur;
            cur = cur.getNext();
        }
        System.out.println("The selected word is not in the list.");
    }

    private void removeHead(){
        head = head.getNext();
        size--;
    }

    public void printList() {
        if (size == 0) return;
        Node cur = head;
        while(cur != null) {
            System.out.println(cur.getElement());
            cur = cur.getNext();
        }
    }

    public boolean isInsideList(String word){
        if (size == 0) return false;
        Node cur = head;
        while (cur != null){
            if (cur.getElement().equals(word)) return true;
            cur = cur.getNext();
        }
        return false;
    }

    public void printSize(){
        System.out.println("The size is: " + size);
    }

}


