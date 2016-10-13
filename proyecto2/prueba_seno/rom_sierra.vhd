library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity rom_sierra is
    port (
        clk  : in  std_logic;
        en   : in  std_logic := '1';
        addr : in  std_logic_vector(10 downto 0);
        data : out std_logic_vector(11 downto 0)
    );
end rom_sierra;

architecture arch of rom_sierra is
    type memoria_rom is array (0 to 2047) of std_logic_vector (11 downto 0);
    constant ROM : memoria_rom := (
        x"002", x"004", x"006", x"008", x"00a", x"00c", x"00e", x"010", 
        x"012", x"014", x"016", x"018", x"01a", x"01c", x"01e", x"020",
        x"022", x"024", x"026", x"028", x"02a", x"02c", x"02e", x"030",
        x"032", x"034", x"036", x"038", x"03a", x"03c", x"03e", x"040",
        x"042", x"044", x"046", x"048", x"04a", x"04c", x"04e", x"050",
        x"052", x"054", x"056", x"058", x"05a", x"05c", x"05e", x"060",
        x"062", x"064", x"066", x"068", x"06a", x"06c", x"06e", x"070",
        x"072", x"074", x"076", x"078", x"07a", x"07c", x"07e", x"080",
        x"082", x"084", x"086", x"088", x"08a", x"08c", x"08e", x"090",
        x"092", x"094", x"096", x"098", x"09a", x"09c", x"09e", x"0a0",
        x"0a2", x"0a4", x"0a6", x"0a8", x"0aa", x"0ac", x"0ae", x"0b0",
        x"0b2", x"0b4", x"0b6", x"0b8", x"0ba", x"0bc", x"0be", x"0c0",
        x"0c2", x"0c4", x"0c6", x"0c8", x"0ca", x"0cc", x"0ce", x"0d0",
        x"0d2", x"0d4", x"0d6", x"0d8", x"0da", x"0dc", x"0de", x"0e0",
        x"0e2", x"0e4", x"0e6", x"0e8", x"0ea", x"0ec", x"0ee", x"0f0",
        x"0f2", x"0f4", x"0f6", x"0f8", x"0fa", x"0fc", x"0fe", x"100",
        x"102", x"104", x"106", x"108", x"10a", x"10c", x"10e", x"110",
        x"112", x"114", x"116", x"118", x"11a", x"11c", x"11e", x"120",
        x"122", x"124", x"126", x"128", x"12a", x"12c", x"12e", x"130",
        x"132", x"134", x"136", x"138", x"13a", x"13c", x"13e", x"140",
        x"142", x"144", x"146", x"148", x"14a", x"14c", x"14e", x"150",
        x"152", x"154", x"156", x"158", x"15a", x"15c", x"15e", x"160",
        x"162", x"164", x"166", x"168", x"16a", x"16c", x"16e", x"170",
        x"172", x"174", x"176", x"178", x"17a", x"17c", x"17e", x"180",
        x"182", x"184", x"186", x"188", x"18a", x"18c", x"18e", x"190",
        x"192", x"194", x"196", x"198", x"19a", x"19c", x"19e", x"1a0",
        x"1a2", x"1a4", x"1a6", x"1a8", x"1aa", x"1ac", x"1ae", x"1b0",
        x"1b2", x"1b4", x"1b6", x"1b8", x"1ba", x"1bc", x"1be", x"1c0",
        x"1c2", x"1c4", x"1c6", x"1c8", x"1ca", x"1cc", x"1ce", x"1d0",
        x"1d2", x"1d4", x"1d6", x"1d8", x"1da", x"1dc", x"1de", x"1e0",
        x"1e2", x"1e4", x"1e6", x"1e8", x"1ea", x"1ec", x"1ee", x"1f0",
        x"1f2", x"1f4", x"1f6", x"1f8", x"1fa", x"1fc", x"1fe", x"200",
        x"202", x"204", x"206", x"208", x"20a", x"20c", x"20e", x"210",
        x"212", x"214", x"216", x"218", x"21a", x"21c", x"21e", x"220",
        x"222", x"224", x"226", x"228", x"22a", x"22c", x"22e", x"230",
        x"232", x"234", x"236", x"238", x"23a", x"23c", x"23e", x"240",
        x"242", x"244", x"246", x"248", x"24a", x"24c", x"24e", x"250",
        x"252", x"254", x"256", x"258", x"25a", x"25c", x"25e", x"260",
        x"262", x"264", x"266", x"268", x"26a", x"26c", x"26e", x"270",
        x"272", x"274", x"276", x"278", x"27a", x"27c", x"27e", x"280",
        x"282", x"284", x"286", x"288", x"28a", x"28c", x"28e", x"290",
        x"292", x"294", x"296", x"298", x"29a", x"29c", x"29e", x"2a0",
        x"2a2", x"2a4", x"2a6", x"2a8", x"2aa", x"2ac", x"2ae", x"2b0",
        x"2b2", x"2b4", x"2b6", x"2b8", x"2ba", x"2bc", x"2be", x"2c0",
        x"2c2", x"2c4", x"2c6", x"2c8", x"2ca", x"2cc", x"2ce", x"2d0",
        x"2d2", x"2d4", x"2d6", x"2d8", x"2da", x"2dc", x"2de", x"2e0",
        x"2e2", x"2e4", x"2e6", x"2e8", x"2ea", x"2ec", x"2ee", x"2f0",
        x"2f2", x"2f4", x"2f6", x"2f8", x"2fa", x"2fc", x"2fe", x"300",
        x"302", x"304", x"306", x"308", x"30a", x"30c", x"30e", x"310",
        x"312", x"314", x"316", x"318", x"31a", x"31c", x"31e", x"320",
        x"322", x"324", x"326", x"328", x"32a", x"32c", x"32e", x"330",
        x"332", x"334", x"336", x"338", x"33a", x"33c", x"33e", x"340",
        x"342", x"344", x"346", x"348", x"34a", x"34c", x"34e", x"350",
        x"352", x"354", x"356", x"358", x"35a", x"35c", x"35e", x"360",
        x"362", x"364", x"366", x"368", x"36a", x"36c", x"36e", x"370",
        x"372", x"374", x"376", x"378", x"37a", x"37c", x"37e", x"380",
        x"382", x"384", x"386", x"388", x"38a", x"38c", x"38e", x"390",
        x"392", x"394", x"396", x"398", x"39a", x"39c", x"39e", x"3a0",
        x"3a2", x"3a4", x"3a6", x"3a8", x"3aa", x"3ac", x"3ae", x"3b0",
        x"3b2", x"3b4", x"3b6", x"3b8", x"3ba", x"3bc", x"3be", x"3c0",
        x"3c2", x"3c4", x"3c6", x"3c8", x"3ca", x"3cc", x"3ce", x"3d0",
        x"3d2", x"3d4", x"3d6", x"3d8", x"3da", x"3dc", x"3de", x"3e0",
        x"3e2", x"3e4", x"3e6", x"3e8", x"3ea", x"3ec", x"3ee", x"3f0",
        x"3f2", x"3f4", x"3f6", x"3f8", x"3fa", x"3fc", x"3fe", x"400",
        x"402", x"404", x"406", x"408", x"40a", x"40c", x"40e", x"410",
        x"412", x"414", x"416", x"418", x"41a", x"41c", x"41e", x"420",
        x"422", x"424", x"426", x"428", x"42a", x"42c", x"42e", x"430",
        x"432", x"434", x"436", x"438", x"43a", x"43c", x"43e", x"440",
        x"442", x"444", x"446", x"448", x"44a", x"44c", x"44e", x"450",
        x"452", x"454", x"456", x"458", x"45a", x"45c", x"45e", x"460",
        x"462", x"464", x"466", x"468", x"46a", x"46c", x"46e", x"470",
        x"472", x"474", x"476", x"478", x"47a", x"47c", x"47e", x"480",
        x"482", x"484", x"486", x"488", x"48a", x"48c", x"48e", x"490",
        x"492", x"494", x"496", x"498", x"49a", x"49c", x"49e", x"4a0",
        x"4a2", x"4a4", x"4a6", x"4a8", x"4aa", x"4ac", x"4ae", x"4b0",
        x"4b2", x"4b4", x"4b6", x"4b8", x"4ba", x"4bc", x"4be", x"4c0",
        x"4c2", x"4c4", x"4c6", x"4c8", x"4ca", x"4cc", x"4ce", x"4d0",
        x"4d2", x"4d4", x"4d6", x"4d8", x"4da", x"4dc", x"4de", x"4e0",
        x"4e2", x"4e4", x"4e6", x"4e8", x"4ea", x"4ec", x"4ee", x"4f0",
        x"4f2", x"4f4", x"4f6", x"4f8", x"4fa", x"4fc", x"4fe", x"500",
        x"502", x"504", x"506", x"508", x"50a", x"50c", x"50e", x"510",
        x"512", x"514", x"516", x"518", x"51a", x"51c", x"51e", x"520",
        x"522", x"524", x"526", x"528", x"52a", x"52c", x"52e", x"530",
        x"532", x"534", x"536", x"538", x"53a", x"53c", x"53e", x"540",
        x"542", x"544", x"546", x"548", x"54a", x"54c", x"54e", x"550",
        x"552", x"554", x"556", x"558", x"55a", x"55c", x"55e", x"560",
        x"562", x"564", x"566", x"568", x"56a", x"56c", x"56e", x"570",
        x"572", x"574", x"576", x"578", x"57a", x"57c", x"57e", x"580",
        x"582", x"584", x"586", x"588", x"58a", x"58c", x"58e", x"590",
        x"592", x"594", x"596", x"598", x"59a", x"59c", x"59e", x"5a0",
        x"5a2", x"5a4", x"5a6", x"5a8", x"5aa", x"5ac", x"5ae", x"5b0",
        x"5b2", x"5b4", x"5b6", x"5b8", x"5ba", x"5bc", x"5be", x"5c0",
        x"5c2", x"5c4", x"5c6", x"5c8", x"5ca", x"5cc", x"5ce", x"5d0",
        x"5d2", x"5d4", x"5d6", x"5d8", x"5da", x"5dc", x"5de", x"5e0",
        x"5e2", x"5e4", x"5e6", x"5e8", x"5ea", x"5ec", x"5ee", x"5f0",
        x"5f2", x"5f4", x"5f6", x"5f8", x"5fa", x"5fc", x"5fe", x"600",
        x"602", x"604", x"606", x"608", x"60a", x"60c", x"60e", x"610",
        x"612", x"614", x"616", x"618", x"61a", x"61c", x"61e", x"620",
        x"622", x"624", x"626", x"628", x"62a", x"62c", x"62e", x"630",
        x"632", x"634", x"636", x"638", x"63a", x"63c", x"63e", x"640",
        x"642", x"644", x"646", x"648", x"64a", x"64c", x"64e", x"650",
        x"652", x"654", x"656", x"658", x"65a", x"65c", x"65e", x"660",
        x"662", x"664", x"666", x"668", x"66a", x"66c", x"66e", x"670",
        x"672", x"674", x"676", x"678", x"67a", x"67c", x"67e", x"680",
        x"682", x"684", x"686", x"688", x"68a", x"68c", x"68e", x"690",
        x"692", x"694", x"696", x"698", x"69a", x"69c", x"69e", x"6a0",
        x"6a2", x"6a4", x"6a6", x"6a8", x"6aa", x"6ac", x"6ae", x"6b0",
        x"6b2", x"6b4", x"6b6", x"6b8", x"6ba", x"6bc", x"6be", x"6c0",
        x"6c2", x"6c4", x"6c6", x"6c8", x"6ca", x"6cc", x"6ce", x"6d0",
        x"6d2", x"6d4", x"6d6", x"6d8", x"6da", x"6dc", x"6de", x"6e0",
        x"6e2", x"6e4", x"6e6", x"6e8", x"6ea", x"6ec", x"6ee", x"6f0",
        x"6f2", x"6f4", x"6f6", x"6f8", x"6fa", x"6fc", x"6fe", x"700",
        x"702", x"704", x"706", x"708", x"70a", x"70c", x"70e", x"710",
        x"712", x"714", x"716", x"718", x"71a", x"71c", x"71e", x"720",
        x"722", x"724", x"726", x"728", x"72a", x"72c", x"72e", x"730",
        x"732", x"734", x"736", x"738", x"73a", x"73c", x"73e", x"740",
        x"742", x"744", x"746", x"748", x"74a", x"74c", x"74e", x"750",
        x"752", x"754", x"756", x"758", x"75a", x"75c", x"75e", x"760",
        x"762", x"764", x"766", x"768", x"76a", x"76c", x"76e", x"770",
        x"772", x"774", x"776", x"778", x"77a", x"77c", x"77e", x"780",
        x"782", x"784", x"786", x"788", x"78a", x"78c", x"78e", x"790",
        x"792", x"794", x"796", x"798", x"79a", x"79c", x"79e", x"7a0",
        x"7a2", x"7a4", x"7a6", x"7a8", x"7aa", x"7ac", x"7ae", x"7b0",
        x"7b2", x"7b4", x"7b6", x"7b8", x"7ba", x"7bc", x"7be", x"7c0",
        x"7c2", x"7c4", x"7c6", x"7c8", x"7ca", x"7cc", x"7ce", x"7d0",
        x"7d2", x"7d4", x"7d6", x"7d8", x"7da", x"7dc", x"7de", x"7e0",
        x"7e2", x"7e4", x"7e6", x"7e8", x"7ea", x"7ec", x"7ee", x"7f0",
        x"7f2", x"7f4", x"7f6", x"7f8", x"7fa", x"7fc", x"7fe", x"800",
        x"802", x"804", x"806", x"808", x"80a", x"80c", x"80e", x"810",
        x"812", x"814", x"816", x"818", x"81a", x"81c", x"81e", x"820",
        x"822", x"824", x"826", x"828", x"82a", x"82c", x"82e", x"830",
        x"832", x"834", x"836", x"838", x"83a", x"83c", x"83e", x"840",
        x"842", x"844", x"846", x"848", x"84a", x"84c", x"84e", x"850",
        x"852", x"854", x"856", x"858", x"85a", x"85c", x"85e", x"860",
        x"862", x"864", x"866", x"868", x"86a", x"86c", x"86e", x"870",
        x"872", x"874", x"876", x"878", x"87a", x"87c", x"87e", x"880",
        x"882", x"884", x"886", x"888", x"88a", x"88c", x"88e", x"890",
        x"892", x"894", x"896", x"898", x"89a", x"89c", x"89e", x"8a0",
        x"8a2", x"8a4", x"8a6", x"8a8", x"8aa", x"8ac", x"8ae", x"8b0",
        x"8b2", x"8b4", x"8b6", x"8b8", x"8ba", x"8bc", x"8be", x"8c0",
        x"8c2", x"8c4", x"8c6", x"8c8", x"8ca", x"8cc", x"8ce", x"8d0",
        x"8d2", x"8d4", x"8d6", x"8d8", x"8da", x"8dc", x"8de", x"8e0",
        x"8e2", x"8e4", x"8e6", x"8e8", x"8ea", x"8ec", x"8ee", x"8f0",
        x"8f2", x"8f4", x"8f6", x"8f8", x"8fa", x"8fc", x"8fe", x"900",
        x"902", x"904", x"906", x"908", x"90a", x"90c", x"90e", x"910",
        x"912", x"914", x"916", x"918", x"91a", x"91c", x"91e", x"920",
        x"922", x"924", x"926", x"928", x"92a", x"92c", x"92e", x"930",
        x"932", x"934", x"936", x"938", x"93a", x"93c", x"93e", x"940",
        x"942", x"944", x"946", x"948", x"94a", x"94c", x"94e", x"950",
        x"952", x"954", x"956", x"958", x"95a", x"95c", x"95e", x"960",
        x"962", x"964", x"966", x"968", x"96a", x"96c", x"96e", x"970",
        x"972", x"974", x"976", x"978", x"97a", x"97c", x"97e", x"980",
        x"982", x"984", x"986", x"988", x"98a", x"98c", x"98e", x"990",
        x"992", x"994", x"996", x"998", x"99a", x"99c", x"99e", x"9a0",
        x"9a2", x"9a4", x"9a6", x"9a8", x"9aa", x"9ac", x"9ae", x"9b0",
        x"9b2", x"9b4", x"9b6", x"9b8", x"9ba", x"9bc", x"9be", x"9c0",
        x"9c2", x"9c4", x"9c6", x"9c8", x"9ca", x"9cc", x"9ce", x"9d0",
        x"9d2", x"9d4", x"9d6", x"9d8", x"9da", x"9dc", x"9de", x"9e0",
        x"9e2", x"9e4", x"9e6", x"9e8", x"9ea", x"9ec", x"9ee", x"9f0",
        x"9f2", x"9f4", x"9f6", x"9f8", x"9fa", x"9fc", x"9fe", x"a00",
        x"a02", x"a04", x"a06", x"a08", x"a0a", x"a0c", x"a0e", x"a10",
        x"a12", x"a14", x"a16", x"a18", x"a1a", x"a1c", x"a1e", x"a20",
        x"a22", x"a24", x"a26", x"a28", x"a2a", x"a2c", x"a2e", x"a30",
        x"a32", x"a34", x"a36", x"a38", x"a3a", x"a3c", x"a3e", x"a40",
        x"a42", x"a44", x"a46", x"a48", x"a4a", x"a4c", x"a4e", x"a50",
        x"a52", x"a54", x"a56", x"a58", x"a5a", x"a5c", x"a5e", x"a60",
        x"a62", x"a64", x"a66", x"a68", x"a6a", x"a6c", x"a6e", x"a70",
        x"a72", x"a74", x"a76", x"a78", x"a7a", x"a7c", x"a7e", x"a80",
        x"a82", x"a84", x"a86", x"a88", x"a8a", x"a8c", x"a8e", x"a90",
        x"a92", x"a94", x"a96", x"a98", x"a9a", x"a9c", x"a9e", x"aa0",
        x"aa2", x"aa4", x"aa6", x"aa8", x"aaa", x"aac", x"aae", x"ab0",
        x"ab2", x"ab4", x"ab6", x"ab8", x"aba", x"abc", x"abe", x"ac0",
        x"ac2", x"ac4", x"ac6", x"ac8", x"aca", x"acc", x"ace", x"ad0",
        x"ad2", x"ad4", x"ad6", x"ad8", x"ada", x"adc", x"ade", x"ae0",
        x"ae2", x"ae4", x"ae6", x"ae8", x"aea", x"aec", x"aee", x"af0",
        x"af2", x"af4", x"af6", x"af8", x"afa", x"afc", x"afe", x"b00",
        x"b02", x"b04", x"b06", x"b08", x"b0a", x"b0c", x"b0e", x"b10",
        x"b12", x"b14", x"b16", x"b18", x"b1a", x"b1c", x"b1e", x"b20",
        x"b22", x"b24", x"b26", x"b28", x"b2a", x"b2c", x"b2e", x"b30",
        x"b32", x"b34", x"b36", x"b38", x"b3a", x"b3c", x"b3e", x"b40",
        x"b42", x"b44", x"b46", x"b48", x"b4a", x"b4c", x"b4e", x"b50",
        x"b52", x"b54", x"b56", x"b58", x"b5a", x"b5c", x"b5e", x"b60",
        x"b62", x"b64", x"b66", x"b68", x"b6a", x"b6c", x"b6e", x"b70",
        x"b72", x"b74", x"b76", x"b78", x"b7a", x"b7c", x"b7e", x"b80",
        x"b82", x"b84", x"b86", x"b88", x"b8a", x"b8c", x"b8e", x"b90",
        x"b92", x"b94", x"b96", x"b98", x"b9a", x"b9c", x"b9e", x"ba0",
        x"ba2", x"ba4", x"ba6", x"ba8", x"baa", x"bac", x"bae", x"bb0",
        x"bb2", x"bb4", x"bb6", x"bb8", x"bba", x"bbc", x"bbe", x"bc0",
        x"bc2", x"bc4", x"bc6", x"bc8", x"bca", x"bcc", x"bce", x"bd0",
        x"bd2", x"bd4", x"bd6", x"bd8", x"bda", x"bdc", x"bde", x"be0",
        x"be2", x"be4", x"be6", x"be8", x"bea", x"bec", x"bee", x"bf0",
        x"bf2", x"bf4", x"bf6", x"bf8", x"bfa", x"bfc", x"bfe", x"c00",
        x"c02", x"c04", x"c06", x"c08", x"c0a", x"c0c", x"c0e", x"c10",
        x"c12", x"c14", x"c16", x"c18", x"c1a", x"c1c", x"c1e", x"c20",
        x"c22", x"c24", x"c26", x"c28", x"c2a", x"c2c", x"c2e", x"c30",
        x"c32", x"c34", x"c36", x"c38", x"c3a", x"c3c", x"c3e", x"c40",
        x"c42", x"c44", x"c46", x"c48", x"c4a", x"c4c", x"c4e", x"c50",
        x"c52", x"c54", x"c56", x"c58", x"c5a", x"c5c", x"c5e", x"c60",
        x"c62", x"c64", x"c66", x"c68", x"c6a", x"c6c", x"c6e", x"c70",
        x"c72", x"c74", x"c76", x"c78", x"c7a", x"c7c", x"c7e", x"c80",
        x"c82", x"c84", x"c86", x"c88", x"c8a", x"c8c", x"c8e", x"c90",
        x"c92", x"c94", x"c96", x"c98", x"c9a", x"c9c", x"c9e", x"ca0",
        x"ca2", x"ca4", x"ca6", x"ca8", x"caa", x"cac", x"cae", x"cb0",
        x"cb2", x"cb4", x"cb6", x"cb8", x"cba", x"cbc", x"cbe", x"cc0",
        x"cc2", x"cc4", x"cc6", x"cc8", x"cca", x"ccc", x"cce", x"cd0",
        x"cd2", x"cd4", x"cd6", x"cd8", x"cda", x"cdc", x"cde", x"ce0",
        x"ce2", x"ce4", x"ce6", x"ce8", x"cea", x"cec", x"cee", x"cf0",
        x"cf2", x"cf4", x"cf6", x"cf8", x"cfa", x"cfc", x"cfe", x"d00",
        x"d02", x"d04", x"d06", x"d08", x"d0a", x"d0c", x"d0e", x"d10",
        x"d12", x"d14", x"d16", x"d18", x"d1a", x"d1c", x"d1e", x"d20",
        x"d22", x"d24", x"d26", x"d28", x"d2a", x"d2c", x"d2e", x"d30",
        x"d32", x"d34", x"d36", x"d38", x"d3a", x"d3c", x"d3e", x"d40",
        x"d42", x"d44", x"d46", x"d48", x"d4a", x"d4c", x"d4e", x"d50",
        x"d52", x"d54", x"d56", x"d58", x"d5a", x"d5c", x"d5e", x"d60",
        x"d62", x"d64", x"d66", x"d68", x"d6a", x"d6c", x"d6e", x"d70",
        x"d72", x"d74", x"d76", x"d78", x"d7a", x"d7c", x"d7e", x"d80",
        x"d82", x"d84", x"d86", x"d88", x"d8a", x"d8c", x"d8e", x"d90",
        x"d92", x"d94", x"d96", x"d98", x"d9a", x"d9c", x"d9e", x"da0",
        x"da2", x"da4", x"da6", x"da8", x"daa", x"dac", x"dae", x"db0",
        x"db2", x"db4", x"db6", x"db8", x"dba", x"dbc", x"dbe", x"dc0",
        x"dc2", x"dc4", x"dc6", x"dc8", x"dca", x"dcc", x"dce", x"dd0",
        x"dd2", x"dd4", x"dd6", x"dd8", x"dda", x"ddc", x"dde", x"de0",
        x"de2", x"de4", x"de6", x"de8", x"dea", x"dec", x"dee", x"df0",
        x"df2", x"df4", x"df6", x"df8", x"dfa", x"dfc", x"dfe", x"e00",
        x"e02", x"e04", x"e06", x"e08", x"e0a", x"e0c", x"e0e", x"e10",
        x"e12", x"e14", x"e16", x"e18", x"e1a", x"e1c", x"e1e", x"e20",
        x"e22", x"e24", x"e26", x"e28", x"e2a", x"e2c", x"e2e", x"e30",
        x"e32", x"e34", x"e36", x"e38", x"e3a", x"e3c", x"e3e", x"e40",
        x"e42", x"e44", x"e46", x"e48", x"e4a", x"e4c", x"e4e", x"e50",
        x"e52", x"e54", x"e56", x"e58", x"e5a", x"e5c", x"e5e", x"e60",
        x"e62", x"e64", x"e66", x"e68", x"e6a", x"e6c", x"e6e", x"e70",
        x"e72", x"e74", x"e76", x"e78", x"e7a", x"e7c", x"e7e", x"e80",
        x"e82", x"e84", x"e86", x"e88", x"e8a", x"e8c", x"e8e", x"e90",
        x"e92", x"e94", x"e96", x"e98", x"e9a", x"e9c", x"e9e", x"ea0",
        x"ea2", x"ea4", x"ea6", x"ea8", x"eaa", x"eac", x"eae", x"eb0",
        x"eb2", x"eb4", x"eb6", x"eb8", x"eba", x"ebc", x"ebe", x"ec0",
        x"ec2", x"ec4", x"ec6", x"ec8", x"eca", x"ecc", x"ece", x"ed0",
        x"ed2", x"ed4", x"ed6", x"ed8", x"eda", x"edc", x"ede", x"ee0",
        x"ee2", x"ee4", x"ee6", x"ee8", x"eea", x"eec", x"eee", x"ef0",
        x"ef2", x"ef4", x"ef6", x"ef8", x"efa", x"efc", x"efe", x"f00",
        x"f02", x"f04", x"f06", x"f08", x"f0a", x"f0c", x"f0e", x"f10",
        x"f12", x"f14", x"f16", x"f18", x"f1a", x"f1c", x"f1e", x"f20",
        x"f22", x"f24", x"f26", x"f28", x"f2a", x"f2c", x"f2e", x"f30",
        x"f32", x"f34", x"f36", x"f38", x"f3a", x"f3c", x"f3e", x"f40",
        x"f42", x"f44", x"f46", x"f48", x"f4a", x"f4c", x"f4e", x"f50",
        x"f52", x"f54", x"f56", x"f58", x"f5a", x"f5c", x"f5e", x"f60",
        x"f62", x"f64", x"f66", x"f68", x"f6a", x"f6c", x"f6e", x"f70",
        x"f72", x"f74", x"f76", x"f78", x"f7a", x"f7c", x"f7e", x"f80",
        x"f82", x"f84", x"f86", x"f88", x"f8a", x"f8c", x"f8e", x"f90",
        x"f92", x"f94", x"f96", x"f98", x"f9a", x"f9c", x"f9e", x"fa0",
        x"fa2", x"fa4", x"fa6", x"fa8", x"faa", x"fac", x"fae", x"fb0",
        x"fb2", x"fb4", x"fb6", x"fb8", x"fba", x"fbc", x"fbe", x"fc0",
        x"fc2", x"fc4", x"fc6", x"fc8", x"fca", x"fcc", x"fce", x"fd0",
        x"fd2", x"fd4", x"fd6", x"fd8", x"fda", x"fdc", x"fde", x"fe0",
        x"fe2", x"fe4", x"fe6", x"fe8", x"fea", x"fec", x"fee", x"ff0",
        x"ff2", x"ff4", x"ff6", x"ff8", x"ffa", x"ffc", x"ffe", x"fff"
    );
    signal tmp: std_logic_vector(11 downto 0);
begin

    ret: process (addr,clk) begin
        if (clk' event and clk = '1') then
            tmp <= ROM(conv_integer(addr));
        end if;
    end process;

    buff: process (tmp,en) begin
        if(en = '1') then
            data <= tmp;
        else
            data <= (others => 'Z');
        end if;
    end process buff;
end arch;
