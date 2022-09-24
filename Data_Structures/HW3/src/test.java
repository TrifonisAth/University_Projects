public class test {

    public static void main(String[] args) throws Exception {

        //testLinkedList();

    }

    public static void testLinkedList() throws Exception {
        System.out.println("Start of Linked List testing.");

        SinglyLinkedList ls = new SinglyLinkedList();
        ls.printSize();     // Should be 0.
        ls.insert("abc");
        ls.insert("thanos");
        ls.insert("petros");
        ls.insert("kostas");
        ls.remove("bak");       // Should get an error.
        ls.remove("kostas");
        ls.printSize();         // Should be 3.
        ls.insert("bakura");
        ls.printSize();         // Should be 4.
        ls.printList();

        System.out.println("End of Linked List testing.");

    }
}
