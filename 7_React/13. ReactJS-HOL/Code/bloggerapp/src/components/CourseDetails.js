import React from 'react';

const CourseDetails = ({ courses }) => {
  return (
    <ul>
      {courses.map((course, index) => (
        <div key={index}>
          <h3>{course.name}</h3>
          <h4>{course.date}</h4>
        </div>
      ))}
    </ul>
  );
};

export default CourseDetails;