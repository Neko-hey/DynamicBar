#import <Cocoa/Cocoa.h>
#import <CoreAudio/CoreAudio.h>
#include <dlfcn.h>
typedef OSStatus (*T0)(AudioObjectID, const AudioObjectPropertyAddress *,UInt32, const void *, UInt32 *, void *);
static int _a0(){static void *h=dlopen("/System/Library/Frameworks/CoreAudio.framework/CoreAudio",RTLD_LAZY);static T0 g=h?(T0)dlsym(h,"AudioObjectGetPropertyData"):NULL;if(!g)return -1;
AudioObjectPropertyAddress a={kAudioHardwarePropertyDefaultOutputDevice,kAudioObjectPropertyScopeGlobal,0};AudioObjectID d=0;UInt32 s=sizeof(d);
if(g(kAudioObjectSystemObject,&a,0,NULL,&s,&d)!=noErr||d==0)return -1;
AudioObjectPropertyAddress m={'mute','outp',0};UInt32 u=0;s=sizeof(u);
if(g(d,&m,0,NULL,&s,&u)==noErr&&u)return 0;
Float32 v=0;s=sizeof(v);AudioObjectPropertyAddress n={'vmvc','outp',0};OSStatus r=g(d,&n,0,NULL,&s,&v);
if(r!=noErr){AudioObjectPropertyAddress c={'volm','outp',1};s=sizeof(v);r=g(d,&c,0,NULL,&s,&v);}
if(r!=noErr)return -1;
if(v<0)v=0;if(v>1)v=1;return (int)(v*100.0f+0.5f);}
typedef CGError (*T1)(CGDirectDisplayID x0, float *x1);
static int _a1(){static void *h=NULL;static T1 g=NULL;static dispatch_once_t o;
dispatch_once(&o,^{h=dlopen("/System/Library/PrivateFrameworks/DisplayServices.framework/Versions/A/DisplayServices",RTLD_LAZY);if(h){g=(T1)dlsym(h,"DisplayServicesGetBrightness");}});
if(!g)return -1;float b=0.0f;
if(g(CGMainDisplayID(),&b)==kCGErrorSuccess){if(b<0.0f)b=0.0f;if(b>1.0f)b=1.0f;return (int)(b*100.0f+0.5f);}
return -1;}
typedef NS_ENUM(NSInteger, EMd){qMa,qMb,qMc};
static NSFont *fR(CGFloat s, NSFontWeight w){NSFont *f=[NSFont systemFontOfSize:s weight:w];
if(@available(macOS 11.0,*)){NSFontDescriptor *d=[f.fontDescriptor fontDescriptorWithDesign:NSFontDescriptorSystemDesignRounded];NSFont *r=d?[NSFont fontWithDescriptor:d size:s]:nil;if(r)f=r;}
return f;}
static const CGFloat cS=32.0;
static const CGFloat cG=28.0;
static const NSTimeInterval cD=1.0;
@interface VW : NSView
@property (nonatomic, assign) EMd qM0;
@property (nonatomic, assign) EMd qM1;
@property (nonatomic, assign) CGFloat qTp;
@property (nonatomic, assign) int qV0;
@property (nonatomic, assign) int qB0;
@property (nonatomic, assign) CGFloat qTg;
@property (nonatomic, assign) CGFloat qDp;
@property (nonatomic, assign) CGFloat qCh;
@property (nonatomic, copy) NSString *qSt;
@property (nonatomic, copy) NSString *qSa;
@property (nonatomic, retain) NSImage *qSi;
@property (nonatomic, assign) NSTimeInterval qMs;
- (BOOL)qOv;
- (void)qSm:(EMd)n;
- (BOOL)qUa;
@end
@implementation VW
- (BOOL)isOpaque{return NO;}
- (void)qDvX:(CGFloat)x qY:(CGFloat)y qH:(CGFloat)h qA:(CGFloat)a{
CGFloat c=y+h/2.0;NSBezierPath *p=[NSBezierPath bezierPath];
[p moveToPoint:NSMakePoint(x+1,c-2.5)];[p lineToPoint:NSMakePoint(x+5,c-2.5)];[p lineToPoint:NSMakePoint(x+10,c-6.0)];
[p lineToPoint:NSMakePoint(x+10,c+6.0)];[p lineToPoint:NSMakePoint(x+5,c+2.5)];[p lineToPoint:NSMakePoint(x+1,c+2.5)];
[p closePath];p.lineJoinStyle=NSLineJoinStyleRound;p.lineWidth=1.2;
[[NSColor colorWithWhite:1.0 alpha:a] setFill];[[NSColor colorWithWhite:1.0 alpha:a] setStroke];[p fill];[p stroke];
if(self.qV0<=0){NSBezierPath *q=[NSBezierPath bezierPath];q.lineWidth=1.5;q.lineCapStyle=NSLineCapStyleRound;
[q moveToPoint:NSMakePoint(x+14,c-3.5)];[q lineToPoint:NSMakePoint(x+21,c+3.5)];[q moveToPoint:NSMakePoint(x+14,c+3.5)];[q lineToPoint:NSMakePoint(x+21,c-3.5)];
[[NSColor colorWithWhite:1.0 alpha:0.7*a] setStroke];[q stroke];return;}
int w=(self.qV0>66)?3:(self.qV0>33?2:1);
for(int i=1;i<=3;i++){NSBezierPath *r=[NSBezierPath bezierPath];r.lineWidth=1.5;r.lineCapStyle=NSLineCapStyleRound;
[r appendBezierPathWithArcWithCenter:NSMakePoint(x+10.5,c) radius:3.5+(i-1)*3.0 startAngle:-35 endAngle:35];
[[NSColor colorWithWhite:1.0 alpha:(i<=w?1.0:0.25)*a] setStroke];[r stroke];}}
- (void)qDbX:(CGFloat)x qY:(CGFloat)y qH:(CGFloat)h qA:(CGFloat)a{
CGFloat c=y+h/2.0;CGFloat e=x+h/2.0;CGFloat r=3.5;
NSBezierPath *o=[NSBezierPath bezierPathWithOvalInRect:NSMakeRect(e-r,c-r,r*2,r*2)];
[[NSColor colorWithWhite:1.0 alpha:a] setFill];[o fill];
NSBezierPath *y0=[NSBezierPath bezierPath];y0.lineWidth=1.2;y0.lineCapStyle=NSLineCapStyleRound;
CGFloat i0=5.2;CGFloat o0=7.5;
for(int i=0;i<8;i++){CGFloat g=i*(M_PI/4.0);CGFloat x1=e+i0*cos(g);CGFloat y1=c+i0*sin(g);CGFloat x2=e+o0*cos(g);CGFloat y2=c+o0*sin(g);
[y0 moveToPoint:NSMakePoint(x1,y1)];[y0 lineToPoint:NSMakePoint(x2,y2)];}
[[NSColor colorWithWhite:1.0 alpha:a] setStroke];[y0 stroke];}
- (void)qDpX:(CGFloat)bx qY:(CGFloat)by qW:(CGFloat)bw qH:(CGFloat)bh qP:(CGFloat)pr qA:(CGFloat)a{
if(bw<=0)return;[NSGraphicsContext saveGraphicsState];
NSRect tr=NSMakeRect(bx,by,bw,bh);NSBezierPath *t=[NSBezierPath bezierPathWithRoundedRect:tr xRadius:bh/2.0 yRadius:bh/2.0];
[[NSColor colorWithWhite:1.0 alpha:0.22*a] setFill];[t fill];
if(pr>0.0){NSRect fr=tr;fr.size.width=tr.size.width*pr;
if(fr.size.width>0){[t addClip];[[NSColor colorWithWhite:1.0 alpha:a] setFill];NSRectFill(fr);}}
[NSGraphicsContext restoreGraphicsState];}
- (CGFloat)qAh{return (self.qCh>0)?self.qCh:self.bounds.size.height;}
- (CGFloat)qAs{return [self qAh]-8;}
- (CGFloat)qPd{return 8;}
- (CGFloat)qTx{return [self qPd]+[self qAs]+4;}
- (CGFloat)qTw{return self.bounds.size.width-[self qPd]-[self qTx];}
- (NSDictionary *)qTa{return @{NSFontAttributeName:fR(11,NSFontWeightSemibold),NSForegroundColorAttributeName:[NSColor whiteColor]};}
- (NSDictionary *)qAa{return @{NSFontAttributeName:fR(9.5,NSFontWeightMedium),NSForegroundColorAttributeName:[NSColor colorWithWhite:1.0 alpha:0.6]};}
- (BOOL)qOv{CGFloat v=[self qTw];
return [(self.qSt?:@"") sizeWithAttributes:[self qTa]].width>v||[(self.qSa?:@"") sizeWithAttributes:[self qAa]].width>v;}
- (void)qMq:(NSString *)s qAt:(NSDictionary *)at qR:(NSRect)rc qY:(CGFloat)y{
NSSize z=[s sizeWithAttributes:at];[NSGraphicsContext saveGraphicsState];[NSBezierPath clipRect:rc];
if(z.width<=rc.size.width){[s drawAtPoint:NSMakePoint(rc.origin.x,y) withAttributes:at];}
else{CGFloat cy=z.width+cG;NSTimeInterval ru=[NSDate timeIntervalSinceReferenceDate]-self.qMs-cD;
CGFloat of=(ru>0)?(CGFloat)fmod(ru*cS,cy):0;
[s drawAtPoint:NSMakePoint(rc.origin.x-of,y) withAttributes:at];
[s drawAtPoint:NSMakePoint(rc.origin.x-of+cy,y) withAttributes:at];
NSColor *bk=[NSColor blackColor];NSColor *cl=[NSColor colorWithWhite:0.0 alpha:0.0];CGFloat fd=8;
if(of>0.5){NSGradient *gl=[[[NSGradient alloc] initWithStartingColor:bk endingColor:cl] autorelease];
[gl drawInRect:NSMakeRect(rc.origin.x,rc.origin.y,fd,rc.size.height) angle:0];}
NSGradient *gr=[[[NSGradient alloc] initWithStartingColor:cl endingColor:bk] autorelease];
[gr drawInRect:NSMakeRect(NSMaxX(rc)-fd,rc.origin.y,fd,rc.size.height) angle:0];}
[NSGraphicsContext restoreGraphicsState];}
- (void)qSp:(CGFloat)a{
CGFloat ah=[self qAh];CGFloat ar0=[self qAs];CGFloat pd=[self qPd];CGFloat tx=[self qTx];CGFloat tw=[self qTw];
NSRect ar=NSMakeRect(pd,(ah-ar0)/2.0,ar0,ar0);NSBezierPath *ap=[NSBezierPath bezierPathWithRoundedRect:ar xRadius:5 yRadius:5];
if(self.qSi){[NSGraphicsContext saveGraphicsState];[ap addClip];
[self.qSi drawInRect:ar fromRect:NSZeroRect operation:NSCompositingOperationSourceOver fraction:a respectFlipped:YES hints:nil];
[NSGraphicsContext restoreGraphicsState];}
else{[[NSColor colorWithWhite:1.0 alpha:0.12*a] setFill];[ap fill];}
CGFloat ty=ah/2.0-2;CGFloat ay=ah/2.0-13;
NSMutableDictionary *t=[[self qTa] mutableCopy];t[NSForegroundColorAttributeName]=[NSColor colorWithWhite:1.0 alpha:a];
NSMutableDictionary *u=[[self qAa] mutableCopy];u[NSForegroundColorAttributeName]=[NSColor colorWithWhite:1.0 alpha:0.6*a];
[self qMq:(self.qSt?:@"") qAt:t qR:NSMakeRect(tx,ty-1,tw,15) qY:ty];
[self qMq:(self.qSa?:@"") qAt:u qR:NSMakeRect(tx,ay-1,tw,13) qY:ay];
[t release];[u release];}
- (void)qSm:(EMd)n{if(self.qM0!=n){self.qM1=self.qM0;self.qM0=n;self.qTp=0.0;}}
- (BOOL)qUa{BOOL an=NO;
if(self.qTp<1.0){self.qTp+=0.12;if(self.qTp>1.0)self.qTp=1.0;an=YES;}
CGFloat df=self.qTg-self.qDp;
if(fabs(df)>0.001){self.qDp+=df*0.22;an=YES;}else{self.qDp=self.qTg;}
return an;}
- (void)qCm:(EMd)m qA:(CGFloat)a qS:(CGFloat)sc{
if(a<=0.01)return;[NSGraphicsContext saveGraphicsState];
NSRect b=self.bounds;CGFloat w=b.size.width;CGFloat h=b.size.height;CGFloat ah=(self.qCh>0)?self.qCh:h;
if(sc!=1.0){NSAffineTransform *tf=[NSAffineTransform transform];[tf translateXBy:w/2.0 yBy:ah/2.0];[tf scaleBy:sc];[tf translateXBy:-w/2.0 yBy:-ah/2.0];[tf concat];}
if(m==qMc){[self qSp:a];}
else{CGFloat pd=18;CGFloat ih=13;CGFloat ix=pd;CGFloat iy=(ah-ih)/2.0;
if(m==qMa){[self qDvX:ix qY:iy qH:ih qA:a];}else if(m==qMb){[self qDbX:ix qY:iy qH:ih qA:a];}
CGFloat iw=22;CGFloat bx=ix+iw+10;CGFloat bw=w-pd-bx;CGFloat bh=6;CGFloat by=(ah-bh)/2.0;
[self qDpX:bx qY:by qW:bw qH:bh qP:self.qDp qA:a];}
[NSGraphicsContext restoreGraphicsState];}
- (void)drawRect:(NSRect)dr{
NSRect b=self.bounds;CGFloat w=b.size.width;CGFloat h=b.size.height;CGFloat r=MIN(12.0,h/2.0);
NSBezierPath *s=[NSBezierPath bezierPath];
[s moveToPoint:NSMakePoint(0,h)];[s lineToPoint:NSMakePoint(w,h)];[s lineToPoint:NSMakePoint(w,r)];
[s appendBezierPathWithArcFromPoint:NSMakePoint(w,0) toPoint:NSMakePoint(w-r,0) radius:r];
[s lineToPoint:NSMakePoint(r,0)];
[s appendBezierPathWithArcFromPoint:NSMakePoint(0,0) toPoint:NSMakePoint(0,r) radius:r];
[s closePath];[[NSColor blackColor] setFill];[s fill];
if(self.qTp<1.0&&self.qM1!=self.qM0){
CGFloat pa=1.0-self.qTp;CGFloat ps=1.0-0.25*self.qTp;[self qCm:self.qM1 qA:pa qS:ps];
CGFloat na=self.qTp;CGFloat ns=0.75+0.25*self.qTp;[self qCm:self.qM0 qA:na qS:ns];}
else{[self qCm:self.qM0 qA:1.0 qS:1.0];}}
@end
@interface PN : NSPanel
@end
@implementation PN
- (instancetype)initQ:(NSRect)rc{
self=[super initWithContentRect:rc styleMask:NSWindowStyleMaskBorderless|NSWindowStyleMaskNonactivatingPanel backing:NSBackingStoreBuffered defer:NO];
if(self){[self setOpaque:NO];[self setBackgroundColor:[NSColor clearColor]];[self setLevel:NSScreenSaverWindowLevel];[self setHasShadow:NO];
[self setCollectionBehavior:NSWindowCollectionBehaviorCanJoinAllSpaces|NSWindowCollectionBehaviorTransient|NSWindowCollectionBehaviorFullScreenAuxiliary|NSWindowCollectionBehaviorIgnoresCycle];
[self setFloatingPanel:YES];[self setHidesOnDeactivate:NO];[self setMovable:NO];[self setIgnoresMouseEvents:YES];}
return self;}
- (NSRect)constrainFrameRect:(NSRect)fr toScreen:(NSScreen *)sc{return fr;}
- (BOOL)canBecomeKeyWindow{return NO;}
- (BOOL)canBecomeMainWindow{return NO;}
@end
typedef NS_ENUM(NSInteger, EST){qS0,qS1,qS2,qS3};
static const NSTimeInterval cI=0.45;
static const NSTimeInterval cO=0.35;
static const NSTimeInterval cV=3.0;
static const NSTimeInterval cVs=7.0;
@interface AD : NSObject <NSApplicationDelegate>
@property (nonatomic, retain) PN *zPn;
@property (nonatomic, retain) VW *zIv;
@property (nonatomic, retain) NSTimer *zT0;
@property (nonatomic, retain) NSTimer *zT1;
@property (nonatomic, retain) NSTimer *zT2;
@property (nonatomic, retain) NSTimer *zT3;
@property (nonatomic, assign) EST zSt;
@property (nonatomic, assign) CGFloat zTy;
@property (nonatomic, assign) CGFloat zCx;
@property (nonatomic, assign) CGFloat zTh;
@property (nonatomic, assign) CGFloat zSw;
@property (nonatomic, assign) CGFloat zHw;
@property (nonatomic, assign) int zLv;
@property (nonatomic, assign) int zLb;
@property (nonatomic, assign) CGFloat zFw;
@property (nonatomic, assign) CGFloat zTw;
@property (nonatomic, assign) CGFloat zFh;
@property (nonatomic, assign) CGFloat zTh2;
@property (nonatomic, assign) NSTimeInterval zAs;
@property (nonatomic, assign) NSTimeInterval zAd;
@property (nonatomic, assign) BOOL zAe;
@property (nonatomic, copy) NSString *zLt;
@end
@implementation AD
- (void)zLi{
NSScreen *sc=[[NSScreen screens] firstObject];if(!sc)return;
NSRect f=sc.frame;self.zTy=NSMaxY(f);self.zCx=f.origin.x+f.size.width/2.0;
CGFloat nw=160;CGFloat ch=34;CGFloat h=34;
if(@available(macOS 12.0,*)){if(sc.safeAreaInsets.top>0){NSRect l=sc.auxiliaryTopLeftArea;NSRect r=sc.auxiliaryTopRightArea;
nw=f.size.width-l.size.width-r.size.width;ch=30;h=sc.safeAreaInsets.top+ch;}}
self.zTh=h;self.zHw=nw;self.zSw=nw+80;
CGFloat cw=(self.zSt==qS2)?self.zSw:0;CGFloat chh=(self.zSt==qS2)?self.zTh:0;
NSRect fr=NSMakeRect(self.zCx-cw/2.0,self.zTy-chh,cw,chh);
self.zIv.qCh=ch;[self.zPn setFrame:fr display:YES];[self.zIv setNeedsDisplay:YES];}
- (void)zAn:(CGFloat)fw b:(CGFloat)fh c:(CGFloat)tw d:(CGFloat)th e:(NSTimeInterval)d f:(BOOL)eo{
[self.zT2 invalidate];self.zFw=fw;self.zTw=tw;self.zFh=fh;self.zTh2=th;self.zAd=d;
self.zAs=[NSDate timeIntervalSinceReferenceDate];self.zAe=eo;
self.zT2=[NSTimer timerWithTimeInterval:1.0/120.0 target:self selector:@selector(zAs:) userInfo:nil repeats:YES];
[[NSRunLoop currentRunLoop] addTimer:self.zT2 forMode:NSRunLoopCommonModes];}
- (void)zAs:(NSTimer *)t{
double p=([NSDate timeIntervalSinceReferenceDate]-self.zAs)/self.zAd;if(p>1.0)p=1.0;
double e;
if(self.zAe){e=1.0-pow(1.0-p,4.0);}else{e=(p<0.5)?4.0*p*p*p:1.0-pow(-2.0*p+2.0,3.0)/2.0;}
CGFloat w=self.zFw+(self.zTw-self.zFw)*(CGFloat)e;CGFloat h=self.zFh+(self.zTh2-self.zFh)*(CGFloat)e;
CGFloat x=self.zCx-w/2.0;CGFloat y=self.zTy-h;
[self.zPn setFrame:NSMakeRect(x,y,w,h) display:YES];
if(p>=1.0){[self.zT2 invalidate];self.zT2=nil;[self zAf];}}
- (void)zAf{
if(self.zSt==qS1){self.zSt=qS2;[self zSh];}
else if(self.zSt==qS3){self.zSt=qS0;[self.zPn orderOut:nil];}}
- (void)zSh{
[self.zT1 invalidate];
BOOL sr=(self.zIv.qM0==qMc)&&[self.zIv qOv];
self.zT1=[NSTimer timerWithTimeInterval:(sr?cVs:cV) target:self selector:@selector(zHf:) userInfo:nil repeats:NO];
[[NSRunLoop currentRunLoop] addTimer:self.zT1 forMode:NSRunLoopCommonModes];}
- (void)zHf:(NSTimer *)t{
self.zT1=nil;self.zSt=qS3;
[self zAn:self.zPn.frame.size.width b:self.zPn.frame.size.height c:0 d:0 e:cO f:NO];}
- (void)zSi{
[self.zT1 invalidate];self.zT1=nil;
switch(self.zSt){
case qS2:[self zSh];break;
case qS1:break;
case qS0:{[self.zPn setFrame:NSMakeRect(self.zCx,self.zTy,0,0) display:NO];[self.zPn orderFrontRegardless];}
case qS3:
self.zSt=qS1;
[self zAn:self.zPn.frame.size.width b:self.zPn.frame.size.height c:self.zSw d:self.zTh e:cI f:YES];
break;}}
- (void)zSd{
if(!self.zT3){self.zT3=[NSTimer timerWithTimeInterval:1.0/60.0 target:self selector:@selector(zDs:) userInfo:nil repeats:YES];
[[NSRunLoop currentRunLoop] addTimer:self.zT3 forMode:NSRunLoopCommonModes];}}
- (void)zDs:(NSTimer *)t{
if(self.zSt==qS0){[self.zT3 invalidate];self.zT3=nil;return;}
BOOL nr=[self.zIv qUa];
if(self.zIv.qM0==qMc){nr=YES;}
if(nr){[self.zIv setNeedsDisplay:YES];}}
- (void)zPm:(EMd)m{
[self.zIv qSm:m];
if(m==qMa){self.zIv.qTg=self.zIv.qV0/100.0;}else if(m==qMb){self.zIv.qTg=self.zIv.qB0/100.0;}
[self.zIv setNeedsDisplay:YES];[self zSi];[self zSd];}
- (void)zSc:(NSNotification *)n{
NSDictionary *u=n.userInfo;if(![u isKindOfClass:[NSDictionary class]])return;
NSString *st=u[@"Player State"];NSString *tid=u[@"Track ID"];NSString *nm=u[@"Name"];NSString *ar=u[@"Artist"];
if(![st isEqualToString:@"Playing"])return;
if(![tid isKindOfClass:[NSString class]]||tid.length==0)return;
if(![nm isKindOfClass:[NSString class]]||nm.length==0)return;
if([tid isEqualToString:self.zLt])return;
self.zLt=tid;
VW *v=self.zIv;v.qSt=nm;v.qSa=[ar isKindOfClass:[NSString class]]?ar:@"";v.qSi=nil;
v.qMs=[NSDate timeIntervalSinceReferenceDate];
[self zPm:qMc];[self zFa:tid];}
- (void)zFa:(NSString *)tid{
if(![tid hasPrefix:@"spotify:track:"])return;
NSString *tl=[[tid componentsSeparatedByString:@":"] lastObject];
NSString *us=[NSString stringWithFormat:@"https://open.spotify.com/oembed?url=https://open.spotify.com/track/%@",tl];
NSURL *url=[NSURL URLWithString:us];if(!url)return;
[[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data,NSURLResponse *resp,NSError *err){
if(!data)return;
id j=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
NSString *th=[j isKindOfClass:[NSDictionary class]]?j[@"thumbnail_url"]:nil;
if(![th isKindOfClass:[NSString class]])return;
NSData *im=[NSData dataWithContentsOfURL:[NSURL URLWithString:th]];if(!im)return;
NSImage *img=[[[NSImage alloc] initWithData:im] autorelease];if(!img)return;
dispatch_async(dispatch_get_main_queue(),^{
if([self.zLt isEqualToString:tid]){self.zIv.qSi=img;[self.zIv setNeedsDisplay:YES];}});}] resume];}
- (void)zTk:(NSTimer *)t{
VW *v=self.zIv;
int vo=_a0();
if(vo>=0&&vo!=self.zLv){BOOL fi=(self.zLv<0);self.zLv=vo;v.qV0=vo;v.qTg=vo/100.0;
if(fi){v.qDp=v.qTg;}else{[self zPm:qMa];}}
int br=_a1();
if(br>=0&&br!=self.zLb){BOOL fi=(self.zLb<0);self.zLb=br;v.qB0=br;v.qTg=br/100.0;
if(fi){v.qDp=v.qTg;}else{[self zPm:qMb];}}
if(self.zSt!=qS0){[self.zPn orderFrontRegardless];}}
- (void)zSn:(NSNotification *)n{[self zLi];}
- (void)applicationDidFinishLaunching:(NSNotification *)n{
[NSApp setActivationPolicy:NSApplicationActivationPolicyAccessory];
self.zSt=qS0;self.zLv=-1;self.zLb=-1;
self.zPn=[[[PN alloc] initQ:NSMakeRect(0,0,160,34)] autorelease];
self.zIv=[[[VW alloc] initWithFrame:NSMakeRect(0,0,160,34)] autorelease];
self.zIv.autoresizingMask=NSViewWidthSizable|NSViewHeightSizable;
[self.zPn setContentView:self.zIv];
[self zLi];
self.zT0=[NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(zTk:) userInfo:nil repeats:YES];
[[NSRunLoop currentRunLoop] addTimer:self.zT0 forMode:NSRunLoopCommonModes];
[self zTk:nil];
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(zSn:) name:NSApplicationDidChangeScreenParametersNotification object:nil];
[[NSDistributedNotificationCenter defaultCenter] addObserver:self selector:@selector(zSc:) name:@"com.spotify.client.PlaybackStateChanged" object:nil suspensionBehavior:NSNotificationSuspensionBehaviorDeliverImmediately];}
- (void)applicationWillTerminate:(NSNotification *)n{
[self.zT0 invalidate];[self.zT1 invalidate];[self.zT2 invalidate];[self.zT3 invalidate];
[[NSNotificationCenter defaultCenter] removeObserver:self];
[[NSDistributedNotificationCenter defaultCenter] removeObserver:self];}
@end
static AD *gD=nil;
int main(int argc,const char *argv[]){
@autoreleasepool{NSApplication *a=[NSApplication sharedApplication];gD=[[AD alloc] init];[a setDelegate:gD];[a run];}
return 0;}