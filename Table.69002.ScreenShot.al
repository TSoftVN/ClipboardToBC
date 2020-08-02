table 69002 "Screen Shot"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Screen No."; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Image; Media)
        {
            DataClassification = ToBeClassified;
            //Subtype = Bitmap;
        }
        field(3; "Shot date"; date)
        {

        }
        field(4; Description; Text[50])
        {

        }
    }

    keys
    {
        key(PK; "Screen No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        "Shot date" := WorkDate();
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;
}