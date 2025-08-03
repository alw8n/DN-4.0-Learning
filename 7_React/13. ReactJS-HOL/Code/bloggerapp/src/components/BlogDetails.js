import React from 'react';

const BlogDetails = ({ blogs }) => {
  return (
    <div>
      {blogs.map((blog, index) => (
        <div key={index}>
          <h2>{blog.title}</h2>
          <h4>{blog.author}</h4>
          <p>{blog.desc}</p>
        </div>
      ))}
    </div>
  );
};

export default BlogDetails;