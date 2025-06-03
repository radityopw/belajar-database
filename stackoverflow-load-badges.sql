truncate data_load;

\copy data_load from program 'tr -d "\t" < Badges.xml | sed -e ''s/\\/\\\\/g''' HEADER

INSERT INTO BADGES (
    Id, userId, Name, dt, class, 
    tagbased)
SELECT
     (xpath('//@Id', x))[1]::text::int
    ,(xpath('//@UserId', x))[1]::text::int
    ,(xpath('//@Name', x))[1]::text
    ,(xpath('//@Date', x))[1]::text::timestamp
    ,(xpath('//@Class', x))[1]::text::int
    ,(xpath('//@TagBased', x))[1]::text::boolean
FROM data_load, unnest(xpath('//row', data::xml)) x
WHERE regexp_like(data,'[ ]+\<row');
