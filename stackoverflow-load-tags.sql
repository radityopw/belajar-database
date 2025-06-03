truncate data_load;

\copy data_load from program 'tr -d "\t" < Tags.xml | sed -e ''s/\\/\\\\/g''' HEADER

INSERT INTO tags (
    Id, tagname, count, ExcerptPostId, WikiPostId, IsModeratorOnly, IsRequired)
SELECT
     (xpath('//@Id', x))[1]::text::int
    ,(xpath('//@TagName', x))[1]::text
    ,(xpath('//@Count', x))[1]::text::int
    ,(xpath('//@ExcerptPostId', x))[1]::text::int
    ,(xpath('//@WikiPostId', x))[1]::text::int
    ,(xpath('//@IsModeratorOnly', x))[1]::text::boolean
    ,(xpath('//@IsRequired', x))[1]::text::boolean
FROM data_load, unnest(xpath('//row', data::xml)) x
WHERE regexp_like(data,'[ ]+\<row');
