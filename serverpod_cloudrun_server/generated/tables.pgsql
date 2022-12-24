--
-- Class Book as table book
--

CREATE TABLE "book" (
  "id" serial,
  "name" text NOT NULL
);

ALTER TABLE ONLY "book"
  ADD CONSTRAINT book_pkey PRIMARY KEY (id);


