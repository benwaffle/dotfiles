#!/usr/bin/python3

import xcffib as X
import xcffib.xproto

c = X.connect()

def atom(a):
    return c.core.InternAtom(False, len(a), a).reply().atom


def getwid(wmclass):
    res = []
    def recur(wid):
        prop = c.core.GetProperty(False, wid, xcffib.xproto.Atom.WM_CLASS, xcffib.xproto.Atom.STRING, 0, 10000).reply()

        if prop.value.to_string().startswith(wmclass):
            res.append(wid)

        children = c.core.QueryTree(wid).reply().children.list
        for w in children:
            recur(w)
    recur(c.setup.roots[0].root)
    return res

def blackify(wid):
    theme = atom("_GTK_THEME_VARIANT")
    utf8 = atom("UTF8_STRING")
    c.core.ChangeProperty(xcffib.xproto.PropMode.Replace, wid, theme, utf8, 8, len("dark"), "dark")

for w in getwid("spotify"):
    blackify(w)

c.flush()
c.disconnect()
