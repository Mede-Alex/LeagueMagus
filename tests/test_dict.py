import unittest
import pickle

class DictTest(unittest.TestCase):
    
    PATH = './data/dict.pkl'    
    with open(PATH, 'rb') as f:
            dict_obj = pickle.load(f)
    
    def test_1(self):
        """Check base test"""
        self.assertTrue(issubclass(DictTest, unittest.TestCase))
    
    def test_2(self):
        """Check for Null values"""
        bad_shit_happened = False
            
        for _, values in self.dict_obj.items():
            if None in values:
                bad_shit_happened = True
        self.assertIs(bad_shit_happened, False)

    def test_3(self):
        """Datatypes testing"""
        bad_shit_happened = False
        dtypes_dict = {int : 43, bool: 3} #should be illegal
        l = [type(values[0]) for _, values in self.dict_obj.items()]
        freq_dict = {}
        for el in l:
            if el in freq_dict:
                freq_dict[el] += 1
            else:
                freq_dict[el] = 1
        if freq_dict != dtypes_dict:
            bad_shit_happened = True
        self.assertIs(bad_shit_happened, False)