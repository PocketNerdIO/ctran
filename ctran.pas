program ctran;
{$mode objfpc}{$H+}

// uses fgl;
uses sysutils;

type
    TokenType = string;
    Token = record
        TType : TokenType;
        Literal : string;
    end;
    // TokenDict = specialize TFPGmap<TokenType, string>;
    TokenArray = array of Token;

const
    EOF = 'EOF';
    NEWLINE = 'NEWLINE';
    SEMICOLON = ';';

    ILLEGAL = 'ILLEGAL';
    IDENT = 'IDENT';
    PROPERTYTEXT = 'PROPERTYTEXT';

    LPAREN = '(';
    RPAREN = ')';
    LBRACE = '{';
    RBRACE = '}';
    BANG = '!';

    IMAGE = 'IMAGE';
    LIBR = 'LIBRARY';
    INCEXT = 'EXTERNAL';
    INCLUDE = 'INCLUDE';
    PCLASS = 'CLASS';
    REQUIRE = 'REQUIRE';

    ADD = 'ADD';
    REPLACE = 'REPLACE';
    DEFER = 'DEFER';

    PROP = 'PROPERTY';
    
    TYPES = 'TYPES';
    CONSTANTS = 'CONSTANTS';

// procedure MakeDict();
// begin
//     dict := TokenDict.Create;

//     dict.add('EOF',aur 'EOF');
//     dict.add('NEWLINE', 'NEWLINE');
//     Writeln('Called fine.');
// end;

procedure PrintTestArray(tokenArray: TokenArray);
var
    i: Integer;
begin
    Writeln(' Token      | Literal');
    Writeln('------------|---------');
    for i := 0 to Length(tokenArray) - 1 do
    begin
        Writeln(' ' + tokenArray[i].TType.PadRight(10) + ' | ' + tokenArray[i].Literal);
    end;
    Writeln;
    Writeln('Length: ', Length(tokenArray));
end;

// TODO: Use a pointer to the array?
// procedure AddToken(var tokenArray: TokenArray; newTokenType: TokenType; newTokenLiteral: String);
// var
//     newToken: Token;
// begin
//     newToken.TType := newTokenType;
//     newToken.Literal := newTokenLiteral;
//     tokenArray := concat(tokenArray, [newToken]);
// end;

// Takes a TokenType and a String and puts it into a Token record
function NewToken(newTokenType: TokenType; newTokenLiteral: String): Token;
begin
    NewToken.TType := newTokenType;
    NewToken.Literal := newTokenLiteral;
end;

procedure TestTokeniser();
var
    input: String = '(){}!';
    tests: TokenArray;
    i: Integer;
    subject: String;
begin
    tests := [NewToken(LPAREN, '('),
              NewToken(RPAREN, ')'),
              NewToken(LBRACE, '{'),
              NewToken(RBRACE, '}'),
              NewToken(BANG, '!'),
              NewToken(EOF, '')
    ];

    PrintTestArray(tests);

    for i := 0 to Length(input) - 1 do
    begin
        subject := input.Substring(i, 1);
        if subject = tests[i].Literal then
        begin
            Writeln('OK');
        end
        else
        begin
            Writeln('Nope!')
        end;
    end;
    
    inc(i);

    // Writeln('i is now ' + i.ToString());

    if i > Length(tests) then
    begin
        Writeln('Reached end before EOF - i = ' + i.ToString());
    end;

    if tests[i].Literal = '' then
    begin
        Writeln('EOF found.');
    end
    else
    begin
        Writeln('EOF not found.')
    end;
end;

begin
    TestTokeniser();
end.

