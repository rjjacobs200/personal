
struct SLStack<T> {
  root: SLNode<T>,
}

struct SLNode<T> {
  data: T,
  next: &SLNode<T>,
}

impl<T> SLStack<T> {
  fn new() -> Self {
    Self{None,}
  }
  fn push(&self, el: T) {

  }
  fn pop(&self) -> T {
    if self.root == None {return None;}
    let temp: T = self.root.data;
    self.root = self.root.next;
    self.temp
  }
}

impl<T> SLNode<T> {
  fn new(data: T, next: SLNode<T>) -> Self {
    Self{data, next,}
  }
}
