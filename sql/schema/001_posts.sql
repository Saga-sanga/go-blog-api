-- +goose Up
CREATE TABLE posts (
  id UUID PRIMARY KEY,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  content TEXT,
  category TEXT
);

CREATE TABLE tags (
  id UUID PRIMARY KEY,
  NAME TEXT NOT NULL UNIQUE
)

CREATE TABLE posts_tags (
  post_id UUID NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
  tag_id UUID NOT NULL REFERENCES tags(id) ON DELETE CASCADE,

  PRIMARY KEY (post_id, tag_id)
)

CREATE INDEX idx_posts_tags_tag_id ON posts_tags(tag_id);

-- +goose Down
DROP TABLE posts_tags;
DROP TABLE tags;
DROP TABLE posts;

