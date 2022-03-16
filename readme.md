# Parser for C++ Function Definition

---

## Description

A basic parser for parsing C++ function definition using **LEX and YACC**

---

## Assumptions

- Basic data types are supported (void, bool, char, int, float, double).
- Default arguments are not supported.
- Comments are not supported.
- Variables have to be declared before initialization.
- Basic arithmetic operators are supported (+, -, \*, /, %).
- Comparison operators are not supported (>, <, <=, >=, ==, !=).
- Standard stream objects are not supported (cout, cin not supported).

---

## Usage

Generate **lex.yy.c file**

```
flex fdef.l
```

Generate **y.tab.c and y.tab.h files**

```
bison -yd fdef.y
```

Compile the **C** files generated

```
gcc lex.yy.c y.tab.c
```

Run program using **a.out file**

```
./a.out
```

---

## Examples
### 1.
```
float add(int a, float b){
  float ans;
  ans = a + b;
  return ans;
}
```
### Output:

![OUTPUT-1](images/1.png)


### 2.
```
int ord(char c){
  return c + 0;
}
```
### Output:

![OUTPUT-2](images/2.png)



### 3.
```
int (int b){
  return b;
}
```
### Output:

![OUTPUT-3](images/3.png)



### 4.
```
function(){
  return 0;
}
```
### Output:

![OUTPUT-4](images/4.png)