import React, { Component } from 'react';

class Counter extends Component {
  constructor(props) {
    super(props);
    this.state = {
      count: 5
    };
  }

  sayHello() {
    alert("Hello! Member1");
  }

  increment = () => {
    this.setState({ count: this.state.count + 1 });
    this.sayHello();
  }

  decrement = () => {
    this.setState({ count: this.state.count - 1 });
  }

  render() {
    return (
      <div>
        <p>{this.state.count}</p>
        <button onClick={this.increment}>Increment</button>
        <br />
        <button onClick={this.decrement}>Decrement</button>
      </div>
    );
  }
}

export default Counter;