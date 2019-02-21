use std::ptr;

struct SLStack<T> {
  root: SLNode<T>,
}

struct SLNode<T> {
  data: T,
  next: SLNode<T>,
}

impl<T> SLStack<T> {
  fn new() -> Self {
    Self{ptr::null(),}
  }
  fn push(&self, el: T) {

  }
  fn pop(&self) -> T {
    if root.is_null() {return ptr::null();}
    self.temp: T = self.root.data;
    self.root = self.root.next;
    self.temp
  }
}

impl<T> SLNode<T> {
  fn new(data: T, next: SLNode<T>) -> Self {
    Self{data, next,}
  }
}
