# �������

### ����

<canvas\>��������Զ������ͼ�Σ���ʾ��չʾ��<canvas\>�����ʹ�÷�����

### Ч��Ԥ��

|               ��ҳ              |
|--------------------------------|
|![](screenshots/device/main.png) |

ʹ��˵��

1.�����RenderingContext����ť����ת����RenderingContextҳ��鿴��صķ������ԣ������ť�ɲ鿴��Ӧ�ķ������Ե�Ч��չʾ��

2.�����TransformExample����ť����ת����TransformExampleҳ��鿴��صķ������ԣ������ť�ɲ鿴��Ӧ�ķ������Ե�Ч��չʾ��

3.�����ShadowOffset����ť����ת����ShadowOffsetҳ��鿴��صķ������ԣ������ť�ɲ鿴��Ӧ�ķ������Ե�Ч��չʾ��

4.�����Path2D����ť����ת����Path2Dҳ��鿴������صķ������ԣ������ť�ɲ鿴��Ӧ�ķ������Ե�Ч��չʾ��

5.�����ImageBitmap����ť����ת����ImageBitmapҳ��鿴ͼƬЧ��չʾ��

6.�����CanvasGrident����ť����ת����CanvasGridentҳ��ɲ鿴���ֽ��䷽����Ч��չʾ��

### ����Ŀ¼
```
entry/src/main/ets/MainAbility
|---app.ets
|---pages
|   |---BitmapExample.ets                         // ImageBitmapҳ��,ͼƬЧ��չʾ
|   |---GradientExample.ets                       // CanvasGridentҳ��, չʾ���ֽ��䷽����Ч��
|   |---Index.ets                                 // ��ҳ
|   |---PathExample.ets                           // Path2Dҳ�棬�������Ե�Ч��չʾ
|   |---RenderingContext.ets                      // RenderingContextҳ�棬�������Ե�Ч��չʾ
|   |---RenderingContext1.ets                     // RenderingContext1ҳ�棬�������Ե�Ч��չʾ
|   |---RenderingContext2.ets                     // RenderingContext2ҳ�棬�������Ե�Ч��չʾ
|   |---ShadowOffsetExample.ets                   // ShadowOffsetҳ�棬�������Ե�Ч��չʾ
|   |---TransformExample.ets                      // TransformExampleҳ�棬�������Ե�Ч��չʾ
```

### ����ʵ��

* ����ģ���õ��ӿڣ�[@ohos.router](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis/js-apis-router.md)

* RenderingContextģ�飬�ṩ�˻���Բ��(arc)�������������(strokeText)������һ��·��(closePath)����������(quadraticCurveTo)�����ƻ���(textBaseline)��������

* RenderingContext1ģ�飬�ṩ����ɫ����(strokeStyle)�����߶˵�(lineCap)��͸����(globalAlpha)������ˮƽ����(textAlign)������Բ�α߽�(lineJoin)�����б�ӳ���(miterLimit)���ϳɲ���(globalCompositeOperation)��������

* RenderingContext2ģ�飬�ṩ�˻��ƽ�����������֮��Ļ�(arcTo)���������α���������(bezierCurveTo)��������Բ(ellipse)����������(rect)����ָ���ķ������ظ�ָ����Ԫ��(createPattern)����������(lineDashOffset��setLineDash)����������(scale)��������

* TransformExampleģ�飬�ṩ�˻���ƽ��(translate)�������任(transform)���任����(setTransform)��ͼ����ת(rotate)��������

* ShadowOffsetģ�飬�ṩ�����û򷵻���Ӱ����״�Ĵ�ֱ����(shadowOffsetY)�����û򷵻���Ӱ����״��ˮƽ����(shadowOffsetX)�����û򷵻���Ӱ��ģ������(shadowBlur)��������

* Path2Dģ�飬�ṩ�˻���Բ��(arc)������(quadraticCurveTo)���������α���������(bezierCurveTo)�����ƽ�����������֮��Ļ�(arcTo)��������Բ(ellipse)����������(rect)������һ��·��(closePath)�����·��(addPath)��ƽ�滭ͼ����

* BitmapExampleģ�飬�ṩ��ͼƬЧ��չʾ�ķ���

* CanvasGridentģ�飬�ṩ�˴���(Բ��)�ݶȽ���(createRadialGradient)��������������(createLinearGradient)����

#### ��ظ���

Canvas���ṩ��������������Զ������ͼ�Ρ�

### ���Ȩ��

���漰��

### ����

���漰��

### Լ��������

1.��ʾ����֧�ֱ�׼ϵͳ���С�

2.��ʾ����Ҫʹ��DevEco Studio 3.1 Beta2 (Build Version: 3.1.0.400 ���� 2023��4��7��)�ſɱ������С�

### ����

���赥�����ر����̣�ִ���������
```
git init
git config core.sparsecheckout true
echo /code/UI/ArkTsComponentClollection/Canvas > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```