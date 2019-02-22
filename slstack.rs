
use std::mem;

type SLLink<T> = Option<Box<SLNode<T>>>;
struct SLNode<T> {data: T, next: SLLink<T>}
struct SLStack<T> {root: SLLink<T>}

impl<T> SLStack<T> {
  fn new() -> Self { SLStack {root: None} }
  fn push(&self, elem: T) {
    self.root = Some(Box::new(SLNode {
      data: elem,
      next: mem::replace(&mut self.root, None,)}));
  }
  fn pop(&self) -> T {
    if self.root == None {panic!("Fool! You tried to pop off an empty stack!");}
    let temp: T = self.root.data;
    root:
  }
}
