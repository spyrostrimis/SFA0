import sys,colorsys,math,statistics
sys.path.insert(0,r'C:\Users\CAN\AppData\Local\Temp\claude\D--Games-Street-Fighter-Alpha-Zero\4eb7f93b-58ec-4e26-b890-013cd1e0a74d\scratchpad')
SKIN={7,9,10,13}; HAIR={11}; TROU={2,3,4,5}; SHIRT={6,12,14,15}; SCARF={8}
def readact(p):
    a=open(p,'rb').read(); return [tuple(a[(255-i)*3:(255-i)*3+3]) for i in range(256)]
def writeact(pal,p):
    b=bytearray()
    for i in range(255,-1,-1): b+=bytes(pal[i])
    open(p,'wb').write(bytes(b))
def boost(pal,groups,hue_override=None):
    out=list(pal)
    for idx,(sf,cf) in groups.items():
        cols=[pal[i] for i in idx]
        hs=[];ss=[]
        for c in cols:
            h,l,s=colorsys.rgb_to_hls(*[v/255 for v in c])
            if s>0.05: hs.append(h); ss.append(s)
        if hue_override is not None and idx in hue_override: H=hue_override[idx]
        elif hs:
            x=sum(math.cos(2*math.pi*h) for h in hs); y=sum(math.sin(2*math.pi*h) for h in hs)
            H=(math.atan2(y,x)/(2*math.pi))%1.0
        else: H=None
        ref=statistics.median(ss) if ss else 0.0
        for i in idx:
            h,l,s=colorsys.rgb_to_hls(*[v/255 for v in pal[i]])
            if H is None: continue
            ns=min(1.0,max(s,ref)*sf)
            nl=min(1.0,max(0.0,0.5+(l-0.5)*cf))
            out[i]=tuple(int(round(v*255)) for v in colorsys.hls_to_rgb(H,nl,ns))
    return out
GROUPS={frozenset(SKIN):(1.15,1.06),frozenset(HAIR):(1.5,1.05),
        frozenset(TROU):(2.6,1.16),frozenset(SHIRT):(1.5,1.10),frozenset(SCARF):(1.6,1.05)}
if __name__=='__main__':
    base=readact('Pals/eagle01.act.bak')
    variants={'brown (native hue)':None,
              'olive':{frozenset(TROU):0.20},
              'navy':{frozenset(TROU):0.60}}
    for name,ho in variants.items():
        p=boost(base,GROUPS,ho)
        print(f"{name}:")
        for i in sorted(TROU|SHIRT|SKIN|{11,8}):
            print(f"    {i:3} {base[i]} -> {p[i]}")
        break
    import json
    json.dump({'ok':1},open(r'C:\Users\CAN\AppData\Local\Temp\claude\D--Games-Street-Fighter-Alpha-Zero\4eb7f93b-58ec-4e26-b890-013cd1e0a74d\scratchpad\p.json','w'))
