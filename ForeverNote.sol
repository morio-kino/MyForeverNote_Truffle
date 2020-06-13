pragma solidity >=0.4.24;
pragma experimental ABIEncoderV2;

//import "openzeppelin-solidity/contracts/lifecycle/Pausable.sol";
//import "openzeppelin-solidity/contracts/lifecycle/Destructible.sol";
//import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

//contract ForeverNote is Ownable {
contract ForeverNote {
    event Category(
        address indexed _owner,  // Owner
        uint8   indexed _type,   // Category type : 1:main category, 2:subcategory
        uint32          _id,     // Index ID
	uint64          _ctime,  // Create time
        string          _text    // Index text
    );

    event Note(
        address indexed _owner,     // Owner
        uint32  indexed _category1, // main category
        uint32  indexed _category2, // subcategory
        string          _note       // Note
    );

//    constructor(address _creator) public {
//        owner = _creator;
//    }


    function addCategory(uint8  _type,
                      uint32 _id,
                      uint64 _ctime,
                      string calldata _text) external {
        emit Category(msg.sender, _type, _id, _ctime, _text);
    }

    function addCategories(uint8[]  calldata _type,
                       uint32[] calldata _id,
                       uint64[] calldata _ctime,
                       string[] calldata _text) external {
        for(uint i=0; i<_type.length; i++) {
            emit Category(msg.sender, _type[i], _id[i], _ctime[i], _text[i]);
        }
    }

    function addNote(uint32 _category1,
                     uint32 _category2,
                     string calldata _note) external {
        emit Note(msg.sender, _category1, _category2, _note);
    }

    function addNotes(uint32[] calldata _category1,
                      uint32[] calldata _category2,
                      string[] calldata _note) external {
        for(uint i=0; i<_category1.length; i++) {
            emit Note(msg.sender, _category1[i], _category2[i], _note[i]);
        }
    }

    /*
    Error: CompileError: YulException: Stack too deep when compiling inline assembly: Variable headStart is 1 slot(s) too deep inside the stack.
    */
    /*
    function addCategoriesAndNotes(uint8[]  calldata _categoryType,
                               uint32[] calldata _categoryId,
                               uint64[] calldata _categoryCtime,
                               string[] calldata _categoryText,
                               uint32[] calldata _noteCategory1,
                               uint32[] calldata _noteCategory2,
                               string[] calldata _noteData
                               ) external {
        // add category
        for(uint i=0; i<_categoryType.length; i++) {
            emit Category(msg.sender, _categoryType[i], _categoryId[i], _categoryCtime[i], _categoryText[i]);
        }

        // add note
        for(uint i=0; i<_noteCategory1.length; i++) {
            emit Note(msg.sender, _noteCategory1[i], _noteCategory2[i], _noteData[i]);
        }
    }
    */
}

