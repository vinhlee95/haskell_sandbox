import qualified Data.Set as Set  
import Data.Char (toUpper, toLower)

set1 = Set.fromList ["foo", "bar"]
set2 = Set.fromList ["bar", "baz"]

uniqueUnionList = Set.toList $ Set.union set1 set2 -- ["bar","baz","foo"]
uniqueIntersectionList = Set.toList $ Set.intersection set1 set2 -- ["bar"]

-- Check size/length of the set
uniqueUnionListSize = Set.size $ Set.union set1 set2 -- 3

-- Map with Set
uppercaseSet1 = Set.map (map toUpper) set1 -- fromList ["BAR","FOO"]
withSuffix = Set.map (++ "_SUFFIX") set1 -- fromList ["bar_SUFFIX","foo_SUFFIX"]

-- Filter with Set
setWithFooOnly = Set.filter (== "foo") set1 -- fromList ["foo"]
-- Transform set1 to lowercase before filtering
setWithBarOnly = Set.filter (== "bar") $ Set.map (map toLower) set1 -- fromList ["bar"]
