#[macro_use]
extern crate ndarray;

use ndarray::prelude::*;
use ndarray_rand::RandomExt;
use ndarray_rand::rand_distr::Uniform;

fn main() {
    let a = array![[1,2,3],[2,3,4]];
    println!("{}",a);

    let b = Array::range(0., 10., 0.5);
    println!("{}", b);

    let c = Array::linspace(0., 10., 11);
    println!("{}", c);

    let r = Array::random((2,5), Uniform::new(0., 1.));
    println!("{}", r);

    let mut a1 = array![1,2,3,4,5];
    let mut a2 = array![1,2,3,4,5];
    let mut a3 = &a1 * &a2;

    println!("{}", &a1*&a2);
    println!("{}", &a1.t());
    println!("{}", a3);
    a1 += 1;
    println!("{}", &a1.t());
    println!("{}", a3);
    println!("{}", a3);
    println!("{}", &a1*&a2);

    let z1: Array2<i32> = Array::zeros((10,10));
    println!("{}", z1);
}
