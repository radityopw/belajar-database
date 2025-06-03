truncate data_load;

\copy data_load from program 'tr -d "\t" < PostHistory.xml | sed -e ''s/\\/\\\\/g''' HEADER

INSERT INTO posthistory (
    Id, PostHistoryTypeId, postId, RevisionGUID, CreationDate, 
    userID, text, ContentLicense)
SELECT
     (xpath('//@Id', x))[1]::text::int
    ,(xpath('//@PostHistoryTypeId', x))[1]::text::int
    ,(xpath('//@PostId', x))[1]::text::int
    ,(xpath('//@RevisionGUID', x))[1]::text
    ,(xpath('//@CreationDate', x))[1]::text::timestamp
    ,(xpath('//@UserId', x))[1]::text::int
    ,(xpath('//@Text', x))[1]::text
    ,(xpath('//@ContentLicense', x))[1]::text
FROM data_load, unnest(xpath('//row', data::xml)) x
WHERE regexp_like(data,'[ ]+\<row');
