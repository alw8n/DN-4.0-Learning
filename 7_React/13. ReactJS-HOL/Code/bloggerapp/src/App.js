import React from 'react';
import BookDetails from './components/BookDetails';
import BlogDetails from './components/BlogDetails';
import CourseDetails from './components/CourseDetails';
import { books, blogs, courses } from './data';
import './App.css';

function App() {
  return (
    <div className="container">
      <div className="mystyle1 column">
        <h1>Course Details</h1>
        <CourseDetails courses={courses} />
      </div>

      <div className="st2 column">
        <h1>Book Details</h1>
        <BookDetails books={books} />
      </div>

      <div className="v1 column">
        <h1>Blog Details</h1>
        <BlogDetails blogs={blogs} />
      </div>
    </div>
  );
}

export default App;