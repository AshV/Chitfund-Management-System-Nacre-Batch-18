using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BALChitFundManagementSystem.BE
{
    public class BE_ChitdocumentproofId
    {
        private int _documentProofId;
        private int _chitId; 
        private Byte[] _document;
        private string _description;
 
        public int DocumentProofId
        {
            get { return _documentProofId; }
            set { _documentProofId = value; }
        }
            public int ChitId
            {
                get { return _chitId; }
                set { _chitId = value; }
            }
                public Byte[] Document
            {
                get { return _document; }
                set { _document= value; }
                }
                public string Description
                {

                    get { return _description; }
                    set { _description = value; }
                }
           
    }
}
