truncate data_load;

\copy data_load from program 'tr -d "\t" < Comments.xml | sed -e ''s/\\/\\\\/g''' HEADER

INSERT INTO COMMENTS (
    Id, postId, score, text, creationdate, 
    userid, contentlicense)
SELECT
     (xpath('//@Id', x))[1]::text::int
    ,(xpath('//@PostId', x))[1]::text::int
    ,(xpath('//@Score', x))[1]::text::int
    ,(xpath('//@Text', x))[1]::text
    ,(xpath('//@CreationDate', x))[1]::text::timestamp
    ,(xpath('//@UserId', x))[1]::text::int
    ,(xpath('//@ContentLicense', x))[1]::text
FROM data_load, unnest(xpath('//row', data::xml)) x
WHERE regexp_like(data,'[ ]+\<row');
