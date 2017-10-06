--
-- remove Document from database
--

select @idDocument:=idDocument FROM document where entry = 'doc_doc_ted_jp_2' LIMIT 1;

-- remove sentences

start transaction;

delete from Label
where idLayer in
(
select idLayer from Layer
where idAnnotationSet in
(
select idAnnotationSet from AnnotationSet
where idSentence in
(
select idSentence from Sentence
where idParagraph in
(select idParagraph from Paragraph where idDocument = @idDocument)
)
)
);

delete from Layer
where idAnnotationSet in
(
select idAnnotationSet from AnnotationSet
where idSentence in
(
select idSentence from Sentence
where idParagraph in
(select idParagraph from Paragraph where idDocument = @idDocument)
)
);


delete from AnnotationSet
where idSentence in
(
select idSentence from Sentence
where idParagraph in
(select idParagraph from Paragraph where idDocument = @idDocument)
);

delete from Sentence
where idParagraph in
(select idParagraph from Paragraph where idDocument = @idDocument);

delete from Paragraph
where idDocument = @idDocument;

delete from Document 
where idDocument = @idDocument;

delete from Entry
where entry = 'doc_doc_ted_jp_2';

commit;
