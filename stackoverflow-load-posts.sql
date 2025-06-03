truncate data_load;

\copy data_load from program 'tr -d "\t" < Posts.xml | sed -e ''s/\\/\\\\/g''' HEADER

INSERT INTO POSTS (
    Id, PostTypeId, CreationDate, score, viewcount, 
    body, OwnerUserId, LastActivityDate, Title, Tags, AnswerCount,
    CommentCount, ContentLicense)
SELECT
     (xpath('//@Id', x))[1]::text::int
    ,(xpath('//@PostTypeId', x))[1]::text::int
    ,(xpath('//@CreationDate', x))[1]::text::timestamp
    ,(xpath('//@Score', x))[1]::text::int
    ,(xpath('//@ViewCount', x))[1]::text::int
    ,(xpath('//@Body', x))[1]::text 
    ,(xpath('//@OwnerUserId', x))[1]::text::int 
    ,(xpath('//@LastActivityDate', x))[1]::text::timestamp 
    ,(xpath('//@Title', x))[1]::text 
    ,(xpath('//@Tags', x))[1]::text 
    ,(xpath('//@AnswerCount', x))[1]::text::int 
    ,(xpath('//@CommentCount', x))[1]::text::int 
    ,(xpath('//@ContentLicense', x))[1]::text 
FROM data_load, unnest(xpath('//row', data::xml)) x
WHERE regexp_like(data,'[ ]+\<row');
