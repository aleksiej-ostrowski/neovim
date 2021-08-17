" cp .vimrc ~/.config/nvim/init.vim

set nowrap
set tabstop=4
set expandtab
set shiftwidth=4
set number
set showcmd
set history=500

set nobackup
set noswapfile

set encoding=utf-8

iab <expr> dd strftime("%F %X")

iab 0x0_ver # -*- coding: utf-8 -*-<CR>
\<CR>#--------------------------------#
\<CR>#                                #
\<CR>#  version 0.0.1                 #
\<CR>#                                #
\<CR>#  Aleksiej Ostrowski, 2021      #
\<CR>#                                #
\<CR>#  https://aleksiej.com          #
\<CR>#                                #
\<CR>#--------------------------------#

cab 0x0_del %s/\r//g

iab 0x0_main if __name__ == '__main__':
\<CR>main()


iab 0x0_def x = 10
\<CR>def all_the_args(*args, **kwargs):
\<CR>global x
\<CR>print(x)
\<CR>print(args)
\<CR>print(kwargs)
\<CR>"""
\<CR>all_the_args(1, 2, a=3, b=4)
\<CR>args (1, 2)
\<CR>kwargs {"a": 3, "b": 4}
\<CR>"""

iab 0x0_iter def flatten(l):
\<CR>for el in l:
\<CR>if isinstance(el, list):
\<CR>yield from flatten(el)
\<CR>else:
\<CR>yield el
\<CR>""
\<CR><C-D><C-D><C-D>for i in flatten([1, 2, 3, [[4, 5], 6]]):
\<CR>print(i)

iab 0x0_file with open('...', 'r', encoding = 'cp1251') as in_, open('...', 'w', encoding = 'cp1251') as out_:
\<CR>for s in in_.readlines():
\<CR>s = s.strip().replace(",", "\n")
\<CR>out_.write(s)

iab 0x0_lambda list(map(lambda x:x+1,[1,2,3,4,5]))
\<CR>def compact(lst):
\<CR>return list(filter(None, lst))
\<CR>print(compact([0, 1, False, 2, '', 3, 'a', 's', 34])) # [ 1, 2, 3, 'a', 's', 34 ]
\<CR>#list(filter(lambda x: x > 5, [3, 4, 5, 6, 7])) # => [6, 7]

iab 0x0_yield def gen(n):
\<CR>while True:
\<CR>yield n
\<CR>n += 1<CR>
\<CR><C-D><C-D>G = gen(3)
\<CR><C-D>print(next(G))
\<CR><C-D>print(next(G))

iab 0x0_merge import collections
\<CR>
\<CR>def merge(l):
\<CR>for el in l:
\<CR>if isinstance(el, collections.Iterable) and not isinstance(el, (str, bytes)):
\<CR>yield from merge(el)
\<CR>else:
\<CR>yield el

iab 0x0_count from collections import Counter
\<CR>my_list = ['a','a','b','b','b','c','d','d','d','d','d']
\<CR>count = Counter(my_list)
\<CR># Counter({'d': 5, 'b': 3, 'a': 2, 'c': 1})
\<CR># print(count['b'])
\<CR># print(count.most_common(1))
\<CR># [('d', 5)]

iab 0x0_string my_string = "ABCDE"
\<CR>reversed_string = my_string[::-1]
\<CR>print(reversed_string)<CR>

iab 0x0_tran array = [['a', 'b'], ['c', 'd'], ['e', 'f']]
\<CR>transposed = zip(*array)
\<CR>print(list(transposed)) # [('a', 'c', 'e'), ('b', 'd', 'f')]<CR>
\<CR>a, *b, c = (1, 2, 3, 4) # 1, [2, 3], 4

iab 0x0_clear def e_str(s):
\<CR>delete_chars="""';,"\n\t\r"""
\<CR>s1 = s.translate(None,delete_chars)
\<CR>return " ".join(s1.split())<CR>

iab 0x0_comb from itertools import combinations, combinations_with_replacement, permutations
\<CR>a = combinations('abc', 2)
\<CR># [('a', 'b'), ('a', 'c'), ('b', 'c')]
\<CR>a = combinations_with_replacement('abc', 2)
\<CR>#[('a', 'a'), ('a', 'b'), ('a', 'c'), ('b', 'b'), ('b', 'c'), ('c', 'c')]
\<CR>a = permutations('abc', 2)
\<CR># [('a', 'b'), ('a', 'c'), ('b', 'a'), ('b', 'c'), ('c', 'a'), ('c', 'b')]<CR>

iab 0x0_glob import glob
\<CR>files = glob.glob('./*.csv')
\<CR>for fn in files:
\<CR>print(fn)
\<CR>with open(fn, 'r+', encoding = 'cp1251') as f:
\<CR>lines = f.readlines()
\<CR>del lines[0]
\<CR>f.seek(0)
\<CR>for ll in lines:
\<CR>f.write(ll)
\<CR><C-D>f.truncate()

iab 0x0_jac def jaccard(a, b):
\<CR>a = set(a)
\<CR>b = set(b)
\<CR>c = a.intersection(b)
\<CR>return float(len(c)) / (len(a) + len(b) - len(c))<CR>

iab 0x0_make_list def make_list(l):
\<CR>return re.sub('\W', ' ', str(l)).lower().split()<CR>

iab 0x0_chunks def chunks(l, n):
\<CR>return [l[i:i+n] for i in range(0, len(l), n)]<CR>

iab 0x0_dict from collections import defaultdict
\<CR>my_dict_list = defaultdict(list)<CR>
\<CR>filled_dict = {"one": 1, "two": 2, "three": 3}
\<CR>print(list(filled_dict.keys())) # ["one", "two", "three"]
\<CR>print(list(filled_dict.values())) # [1, 2, 3]<CR>
\<CR>try:
\<CR>print(filled_dict["one1"])
\<CR>except:
\<CR>print('error')<CR>
\<CR><C-D>print(filled_dict.get("one1") is None) # True
\<CR>print(filled_dict.get("one1", 4)) # 4<CR>
\<CR>a = {}
\<CR>try:
\<CR>print(a['a'])
\<CR>except KeyError as e:
\<CR>if e.args[0] == 'a':
\<CR>print("1")
\<CR>else:
\<CR>print("2")
\<CR>raise


iab 0x0_sort x = [7, 8, -10, -9, 3, 0, 4, -5, -1, 6, -7, -3, -4, -8, 2, 9, -6, -2, 5, 1]
\<CR># x.sort()
\<CR># sorted(x)

iab 0x0_format print("{foo} and {bar}".format(bar=10, foo="{foo}"))
\<CR>print("{} and {}".format(10, "foo"))
\<CR>print("{0} and {0}".format(10, "foo"))
\<CR>name = "R"
\<CR>print(f"{name} is {len(name)} characters long.")

iab 0x0_substrings def substrings(s):
\<CR>for k in range(1, len(s)+1):
\<CR>for i in range(len(s)-k+1):
\<CR>yield s[i:i+k]<CR>

iab 0x0_regex # -*- coding: utf-8 -*-
\<CR>
\<CR>import re
\<CR>
\<CR>test_str = r'__" 011*12  (*2345*) 34 112, "*12, "qwe"*2 (23)  "*1'
\<CR>print(test_str)
\<CR>subst = u"%%"
\<CR># --- 1
\<CR>p = re.compile(r'(?<="\*)[0-9]{1,}', re.MULTILINE \| re.IGNORECASE)
\<CR>result = re.sub(p, subst, test_str) # replace 12 and 2 after "* to %%_
\<CR>print(result)
\<CR># --- 2
\<CR>p = re.compile(r'(?<=\()[^\[.]+?(?=\))', re.MULTILINE \| re.IGNORECASE)
\<CR>result = re.sub(p, subst, test_str) # replace *2345* and 23 in brackets to %%
\<CR>print(result)
\<CR># --- 3
\<CR>p = re.compile(r'".*?"\*[0-9]{1,}', re.MULTILINE \| re.IGNORECASE)
\<CR>result = re.sub(p, subst, test_str) # replace "..."*n to %%
\<CR>print(result)
\<CR>
\<CR>for match in re.finditer(p, test_str):
\<CR>print(match.group())


iab 0x0_arg import argparse
\<CR>import re
\<CR>
\<CR>template1 = r"<q_>Вопрос(.*?)</q_>"
\<CR>new_line1 =  '<q_>Вопрос</q_>'
\<CR>
\<CR>parser = argparse.ArgumentParser(description='delete some fragment from a file')
\<CR>parser.add_argument('-i', help='input file', required=True)
\<CR>
\<CR>args = vars(parser.parse_args())
\<CR>
\<CR>inp = args['i']
\<CR>out = inp + "_" 
\<CR>
\<CR>regex = re.compile(template1, re.IGNORECASE)
\<CR>
\<CR>with open(inp, 'r') as inp_file, open(out, 'w') as out_file:
\<CR>
\<CR>for s in inp_file.xreadlines():
\<CR>out_file.write(regex.sub(new_line1, s)) 


iab 0x0_memory memoryview("text".encode("utf-8")).hex()

iab 0x0_gps from vincenty import vincenty
\<CR>from astropy import units as u
\<CR>p1 = (50., 36.)
\<CR>p2 = (51., 17.)
\<CR>m_len = 1000.0 * vincenty(p1, p2) * u.meter
\<CR>print(m_len)


iab 0x0_html <!DOCTYPE html>
\<CR><html lang="en">
\<CR><head>
\<CR><meta charset="utf-8" />
\<CR><meta name="viewport" content="width=device-width, initial-scale=1.0">
\<CR><title></title>
\<CR><link href="css/custom.css?v=1" rel="stylesheet">
\<CR><link rel="shortcut icon" href="favicon.ico?v=1">
\<CR></head>
\<CR><body>
\<CR><div id="app"></div>
\<CR><script type="text/javascript" src="app.js"></script><CR>
\<CR></body>
\<CR></html><Up>

iab 0x0_css body {
\<CR>margin: 25px;
\<CR>background-color: rgb(240,240,240);
\<CR>font-family: arial, sans-serif;
\<CR>font-size: 14px;
\<CR>}<CR>
\<CR>h1 {
\<CR>font-size: 35px;
\<CR>font-weight: normal;
\<CR>margin-top: 5px;
\<CR>}<CR>
\<CR>/* div span : span within div */
\<CR>/* div > span : span with parent div */
\<CR>/* div.class : div of class */
\<CR>/* div#itemid : div with id */
\<CR>/* a[attr] : a with attr */
\<CR>/* class="someclass"> specified */
\<CR>.someclass { color: red; }<CR>
\<CR>/* id="someid" specified */
\<CR>#someid { color: green; }

