class Stack<T> {
    List<T> _stack = [];

    T pop() => _stack.removeLast();

    void push(T x) => _stack.add(x);

    T get top => _stack.last;
    
    @override
    String toString() => _stack.toString(); 
}

void main() {
    var my_stack = Stack<int>();
    print("A pilha:");
    my_stack.push(2);
    my_stack.push(7);
    print(my_stack);

    print("\nNovo valor adicionado: ");
    my_stack.push(9);
    print(my_stack);

    print("\nTirando o ultimo valor: ");
    my_stack.pop();
    print(my_stack);

    print("\nApenas o topo da pilha: ");
    print(my_stack.top);
}