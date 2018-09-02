xquery version "3.0";

module namespace m="http://foo.org/xquery/sometest";

declare namespace test="http://exist-db.org/xquery/xqsuite";

(: This test should be  NOK but the error is not detected :)
declare
    %test:assertEquals(10)
function m:testSimpleInt() as xs:int {
    100
};

(: This test should be NOK but the error is not detected :)
declare
    %test:assertEquals("a")
function m:testSimpleString()  {
    "b"
};

(: This test should be NOK but the error is not detected :)
declare
    %test:assertEquals("<a><b>c</b></a>")
function m:testSimpleXML()  {
    <a><b>d</b></a>
};

(: This test is OK , the error is handled correctly :)
declare
    %test:assertError("Foobar")
function m:testError() as xs:int {
    error( QName('http://bla', 'Error'), 'Foobar')
};