/**
 * CanvasScenes 画布场景绘制逻辑
 *
 * 场景1 CanvasGradient：线性渐变（多断点）、径向渐变（光晕）、渐变描边
 * 场景2 CanvasPattern：createPattern + repeat/repeat-x/no-repeat 图案填充
 * 场景3 Matrix2D：translate/scale/rotate（弧度）单变换与组合变换、identity 复位、invert 逆变换
 * 场景4 综合：OffscreenCanvas 离屏绘制（渐变+图案）→ transferToImageBitmap →
 *            主画布 setTransform(Matrix2D) 变换贴图，三特性串联
 *
 * 所有函数参数为 CanvasRenderer（主画布与离屏画布上下文的共同基类），
 * 因此同一套绘制逻辑可直接在单元测试中用 OffscreenCanvas 无头执行。
 *
 * API 依据：docs/zh-cn/application-dev/reference/apis-arkui/ts-components-canvas-*.md
 * （CanvasGradient/CanvasPattern/Matrix2D 均为 API 8+，Matrix2D 构造与 rotate 为 API 10+）
 */
import { LogUtil } from './utils/LogUtil';
import { ColorUtil } from './utils/ColorUtil';
import { GeometryUtil, Point } from './utils/GeometryUtil';
import { ColorMetrics } from '@kit.ArkUI';

const TAG = 'CanvasScenes';

/** 圆环阵规格：半径比例 / 点数 / 颜色 */
interface RingSpec {
  rRatio: number;
  count: number;
  color: string;
}

export class CanvasScenes {
  /** 场景1：线性渐变（5 断点彩虹）填充 + 渐变描边圆环 */
  static drawLinearGradient(ctx: CanvasRenderer, w: number, h: number): void {
    LogUtil.info(TAG, '【场景1】CanvasGradient：线性渐变开始');
    // 1.1 createLinearGradient + addColorStop 多断点，实现平滑颜色过渡
    const grad: CanvasGradient = ctx.createLinearGradient(0, 0, w, 0);
    grad.addColorStop(0, '#E53935');
    grad.addColorStop(0.25, '#FB8C00');
    grad.addColorStop(0.5, '#FDD835');
    grad.addColorStop(0.75, '#43A047');
    grad.addColorStop(1, '#1E88E5');
    ctx.fillStyle = grad;
    ctx.fillRect(0, 0, w, h * 0.45);
    LogUtil.info(TAG, `1.1 线性渐变填充：5 个颜色断点，区域 ${Math.round(w)}x${Math.round(h * 0.45)}`);

    // 1.2 渐变描边：strokeStyle 使用同一渐变对象
    ctx.strokeStyle = grad;
    ctx.lineWidth = 8;
    ctx.beginPath();
    ctx.arc(w / 2, h * 0.72, Math.min(w, h) * 0.18, 0, Math.PI * 2);
    ctx.stroke();
    LogUtil.info(TAG, '1.2 渐变描边：圆环描边使用同一渐变对象（fill/stroke 通用）');
    LogUtil.info(TAG, '【场景1】完成');
  }

  /** 场景1：径向渐变光晕（内圈亮 → 外圈透明） */
  static drawRadialGradient(ctx: CanvasRenderer, w: number, h: number): void {
    LogUtil.info(TAG, '【场景1】CanvasGradient：径向渐变开始');
    const cx: number = w / 2;
    const cy: number = h / 2;
    const r: number = Math.min(w, h) * 0.45;
    // createRadialGradient(起点圆, 终点圆)：起点圆半径小于终点圆形成光晕
    const grad: CanvasGradient = ctx.createRadialGradient(cx, cy, r * 0.1, cx, cy, r);
    grad.addColorStop(0, '#FFFFFF');
    grad.addColorStop(0.4, '#7C4DFF');
    grad.addColorStop(1, 'rgba(124, 77, 255, 0)');
    ctx.fillStyle = grad;
    ctx.fillRect(0, 0, w, h);
    LogUtil.info(TAG, `1.3 径向渐变光晕：圆心(${Math.round(cx)},${Math.round(cy)})，内半径 ${Math.round(r * 0.1)} → 外半径 ${Math.round(r)}`);
    LogUtil.info(TAG, '【场景1】完成');
  }

  /**
   * 场景2：CanvasPattern 图案填充（支持指定区域，便于一屏展示多种重复方式）
   * @param bitmap 图案素材（PixelMap 转换的 ImageBitmap）
   * @param repetition 重复方式：repeat / repeat-x / repeat-y / no-repeat
   */
  static drawPatternFill(ctx: CanvasRenderer, x: number, y: number, rw: number, rh: number,
    bitmap: ImageBitmap, repetition: string): void {
    LogUtil.info(TAG, `【场景2】CanvasPattern：createPattern(${repetition}) 开始`);
    // createPattern 可能返回 null（素材无效时），必须判空
    const pattern: CanvasPattern | null = ctx.createPattern(bitmap, repetition);
    if (pattern === null) {
      LogUtil.error(TAG, '2.1 createPattern 返回 null：素材无效');
      return;
    }
    ctx.fillStyle = pattern;
    ctx.fillRect(x, y, rw, rh);
    LogUtil.info(TAG, `2.1 图案填充完成：素材 ${bitmap.width}x${bitmap.height}，重复方式 ${repetition}，区域(${Math.round(x)},${Math.round(y)}) ${Math.round(rw)}x${Math.round(rh)}`);
    LogUtil.info(TAG, '【场景2】完成');
  }

  /** 场景3：Matrix2D 平移变换（translate 后绘制三色块对比原点偏移） */
  static drawMatrixTranslate(ctx: CanvasRenderer, w: number, h: number): void {
    LogUtil.info(TAG, '【场景3】Matrix2D：translate 平移开始');
    ctx.setTransform(new Matrix2D().identity());
    ctx.fillStyle = '#90A4AE';
    ctx.fillRect(20, 20, 60, 30);
    // new Matrix2D() 默认全 0 矩阵（奇异），必须先 identity() 复位为单位矩阵再叠加变换
    const m: Matrix2D = new Matrix2D().identity().translate(120, 80);
    ctx.setTransform(m);
    ctx.fillStyle = '#E53935';
    ctx.fillRect(20, 20, 60, 30);
    LogUtil.info(TAG, `3.1 translate(120, 80)：translateX=${m.translateX}，translateY=${m.translateY}，红色块相对灰色块平移`);
    ctx.setTransform(new Matrix2D().identity());
    LogUtil.info(TAG, '【场景3】完成');
  }

  /** 场景3：Matrix2D 缩放变换（2x 放大与 0.5x 缩小对比） */
  static drawMatrixScale(ctx: CanvasRenderer, w: number, h: number): void {
    LogUtil.info(TAG, '【场景3】Matrix2D：scale 缩放开始');
    ctx.setTransform(new Matrix2D().identity());
    ctx.fillStyle = '#90A4AE';
    ctx.fillRect(40, 40, 50, 50);
    // 以画布中心为缩放锚点：先平移锚点，缩放，再平移回
    const m: Matrix2D = new Matrix2D().identity()
      .translate(w / 2, h / 2)
      .scale(2, 2)
      .translate(-w / 2, -h / 2);
    ctx.setTransform(m);
    ctx.fillStyle = '#1E88E5';
    ctx.fillRect(40, 40, 50, 50);
    LogUtil.info(TAG, `3.2 scale(2, 2)：scaleX=${m.scaleX}，scaleY=${m.scaleY}，蓝色块相对灰色块放大 2 倍`);
    ctx.setTransform(new Matrix2D().identity());
    LogUtil.info(TAG, '【场景3】完成');
  }

  /** 场景3：Matrix2D 旋转变换（0°/30°/60° 三矩形，rotate 参数为弧度） */
  static drawMatrixRotate(ctx: CanvasRenderer, w: number, h: number): void {
    LogUtil.info(TAG, '【场景3】Matrix2D：rotate 旋转开始（参数单位为弧度）');
    const colors: string[] = ['#43A047', '#FDD835', '#E53935'];
    const angles: number[] = [0, 30, 60];
    for (let i = 0; i < angles.length; i++) {
      const rad: number = angles[i] * Math.PI / 180;
      const m: Matrix2D = new Matrix2D().identity()
        .translate(w / 2 + (i - 1) * 110, h / 2)
        .rotate(rad);
      ctx.setTransform(m);
      ctx.fillStyle = colors[i];
      ctx.fillRect(-45, -12, 90, 24);
      LogUtil.info(TAG, `3.3 rotate(${angles[i]}°=${rad.toFixed(3)}rad)：scaleX=${(m.scaleX ?? 0).toFixed(3)}，rotateY=${(m.rotateY ?? 0).toFixed(3)}（cos/sin 矩阵系数）`);
    }
    ctx.setTransform(new Matrix2D().identity());
    LogUtil.info(TAG, '【场景3】完成');
  }

  /** 场景3：Matrix2D 组合变换（translate → rotate → scale 链式叠加）+ invert 逆变换验证 */
  static drawMatrixCombined(ctx: CanvasRenderer, w: number, h: number): void {
    LogUtil.info(TAG, '【场景3】Matrix2D：组合变换开始');
    // 3.4 链式组合：平移到中心 → 旋转 45° → 缩放 1.5 倍 → 绘制嵌套方块
    const m: Matrix2D = new Matrix2D().identity()
      .translate(w / 2, h / 2)
      .rotate(45 * Math.PI / 180)
      .scale(1.5, 1.5);
    ctx.setTransform(m);
    ctx.fillStyle = '#7C4DFF';
    ctx.fillRect(-40, -40, 80, 80);
    ctx.fillStyle = '#FFFFFF';
    ctx.fillRect(-20, -20, 40, 40);
    LogUtil.info(TAG, `3.4 组合变换 translate→rotate(45°)→scale(1.5)：scaleX=${(m.scaleX ?? 0).toFixed(3)}，rotateY=${(m.rotateY ?? 0).toFixed(3)}`);

    // 3.5 invert 逆矩阵：scale(1.5) 的逆是 scale(1/1.5≈0.667)
    const inv: Matrix2D = m.invert();
    LogUtil.info(TAG, `3.5 invert() 逆矩阵：scaleX=${(inv.scaleX ?? 0).toFixed(3)}（预期 ${(1 / (m.scaleX ?? 1)).toFixed(3)} 附近）`);
    ctx.setTransform(new Matrix2D().identity());
    LogUtil.info(TAG, '【场景3】完成');
  }

  /** 场景4：离屏画布内容（渐变背景 + 圆点图案 + 中心圆），供 transferToImageBitmap 后贴到主画布 */
  static drawOffscreenSource(ctx: CanvasRenderer, w: number, h: number, dotBitmap: ImageBitmap): void {
    LogUtil.info(TAG, '【场景4】OffscreenCanvas：离屏绘制开始');
    // 4.1 离屏画布上组合渐变背景
    const bg: CanvasGradient = ctx.createLinearGradient(0, 0, w, h);
    bg.addColorStop(0, '#0D47A1');
    bg.addColorStop(1, '#00ACC1');
    ctx.fillStyle = bg;
    ctx.fillRect(0, 0, w, h);
    // 4.2 离屏画布上叠加圆点图案
    const pattern: CanvasPattern | null = ctx.createPattern(dotBitmap, 'repeat');
    if (pattern !== null) {
      ctx.fillStyle = pattern;
      ctx.globalAlpha = 0.35;
      ctx.fillRect(0, 0, w, h);
      ctx.globalAlpha = 1;
    }
    // 4.3 中心圆
    ctx.fillStyle = '#FFEB3B';
    ctx.beginPath();
    ctx.arc(w / 2, h / 2, Math.min(w, h) * 0.22, 0, Math.PI * 2);
    ctx.fill();
    LogUtil.info(TAG, `4.1-4.3 离屏绘制完成：渐变背景 + 圆点图案（35% 透明度）+ 中心圆，画布 ${w}x${h}`);
  }

  /** 场景4 完整流水线（供注册表与页面调用）：离屏绘制 → transferToImageBitmap → 主画布 Matrix2D 变换贴图 */
  static runCompositeScene(ctx: CanvasRenderer, w: number, h: number, dotBitmap: ImageBitmap): void {
    const offscreen: OffscreenCanvas = new OffscreenCanvas(240, 240);
    const offCtx: OffscreenCanvasRenderingContext2D = offscreen.getContext('2d');
    CanvasScenes.drawOffscreenSource(offCtx, 240, 240, dotBitmap);
    const bitmap: ImageBitmap = offscreen.transferToImageBitmap();
    LogUtil.info(TAG, `transferToImageBitmap：${bitmap.width}x${bitmap.height}`);
    CanvasScenes.drawComposite(ctx, w, h, bitmap);
  }

  /** 场景4：主画布合成——渐变背景 + setTransform(Matrix2D) 旋转缩放贴离屏结果 */
  static drawComposite(ctx: CanvasRenderer, w: number, h: number, offBitmap: ImageBitmap): void {
    LogUtil.info(TAG, '【场景4】主画布合成开始');
    // 4.4 主画布渐变背景
    const bg: CanvasGradient = ctx.createLinearGradient(0, 0, 0, h);
    bg.addColorStop(0, '#263238');
    bg.addColorStop(1, '#455A64');
    ctx.fillStyle = bg;
    ctx.fillRect(0, 0, w, h);
    // 4.5 Matrix2D 组合变换：中心旋转 -15° 并缩放 0.9，贴离屏位图
    const m: Matrix2D = new Matrix2D().identity()
      .translate(w / 2, h / 2)
      .rotate(-15 * Math.PI / 180)
      .scale(0.9, 0.9);
    ctx.setTransform(m);
    ctx.drawImage(offBitmap, -w / 2 * 0.8, -h / 2 * 0.8, w * 0.8, h * 0.8);
    ctx.setTransform(new Matrix2D().identity());
    LogUtil.info(TAG, '4.4-4.5 合成完成：离屏位图经 Matrix2D 旋转 -15°/缩放 0.9 后贴入主画布');
    LogUtil.info(TAG, '【场景4】完成：Gradient + Pattern + Matrix2D 三特性串联');
  }

  /** 扩展：Matrix2D 倾斜变换——属性方式直接设置 rotateX/rotateY（对比方法链式的另一种用法） */
  static drawMatrixSkew(ctx: CanvasRenderer, w: number, h: number): void {
    LogUtil.info(TAG, '【扩展】Matrix2D：属性方式倾斜（rotateX/rotateY 直接赋值）');
    // 属性方式：identity 后直接改倾斜系数，等价于 skew 变换
    const m: Matrix2D = new Matrix2D().identity();
    m.rotateX = 0.35;
    m.rotateY = 0;
    ctx.setTransform(m);
    ctx.fillStyle = '#00897B';
    ctx.fillRect(w * 0.1, h * 0.15, 100, 40);
    LogUtil.info(TAG, `E.1 水平倾斜 rotateX=0.35：scaleX=${(m.scaleX ?? 0).toFixed(2)}，rotateX=${(m.rotateX ?? 0).toFixed(2)}`);

    const m2: Matrix2D = new Matrix2D().identity();
    m2.rotateX = 0;
    m2.rotateY = 0.35;
    ctx.setTransform(m2);
    ctx.fillStyle = '#5C6BC0';
    ctx.fillRect(w * 0.1, h * 0.45, 100, 40);
    LogUtil.info(TAG, `E.2 垂直倾斜 rotateY=0.35：scaleY=${(m2.scaleY ?? 0).toFixed(2)}，rotateY=${(m2.rotateY ?? 0).toFixed(2)}`);

    // 复合：倾斜 + 平移（属性方式构造完整仿射矩阵）
    const m3: Matrix2D = new Matrix2D().identity();
    m3.rotateX = 0.35;
    m3.rotateY = 0;
    m3.translateX = w * 0.55;
    m3.translateY = h * 0.3;
    ctx.setTransform(m3);
    ctx.fillStyle = '#F4511E';
    ctx.fillRect(0, 0, 100, 40);
    LogUtil.info(TAG, `E.3 倾斜+平移复合：rotateX=0.35，translate=(${m3.translateX},${m3.translateY})`);
    ctx.setTransform(new Matrix2D().identity());
    LogUtil.info(TAG, '【扩展】完成');
  }

  /** 扩展：ImageData 像素级操作——createImageData 直接写 RGBA 字节后 putImageData 上屏 */
  static drawImageData(ctx: CanvasRenderer, w: number, h: number): void {
    LogUtil.info(TAG, '【扩展】ImageData：像素级操作开始');
    const size = 64;
    const imgData: ImageData = ctx.createImageData(size, size);
    const data: Uint8ClampedArray = imgData.data;
    // 逐像素写入：R 随 x 渐变、G 随 y 渐变、B 固定、A 不透明
    for (let y = 0; y < size; y++) {
      for (let x = 0; x < size; x++) {
        const i: number = (y * size + x) * 4;
        data[i] = x * 4;
        data[i + 1] = y * 4;
        data[i + 2] = 128;
        data[i + 3] = 255;
      }
    }
    ctx.putImageData(imgData, w / 2 - size / 2, h / 2 - size / 2);
    LogUtil.info(TAG, `E.4 ImageData ${size}x${size} 像素写入并 putImageData 到画布中心（R/G 双向渐变）`);
    LogUtil.info(TAG, '【扩展】完成');
  }

  /** 扩展：渐变动画单帧——ColorUtil 多段插值取色，t∈[0,1]，由页面定时器连续驱动 */
  static drawGradientFrame(ctx: CanvasRenderer, w: number, h: number, t: number): void {
    const grad: CanvasGradient = ctx.createLinearGradient(0, 0, w, 0);
    const stops: string[] = ['#E53935', '#FDD835', '#43A047', '#1E88E5'];
    grad.addColorStop(0, stops[0]);
    grad.addColorStop(0.33, ColorUtil.lerpHexStops(stops, t));
    grad.addColorStop(0.66, ColorUtil.lerpHexStops(stops, (t + 0.5) % 1));
    grad.addColorStop(1, stops[3]);
    ctx.fillStyle = grad;
    ctx.fillRect(0, 0, w, h);
    ctx.fillStyle = '#FFFFFF';
    ctx.font = '16px sans-serif';
    ctx.fillText(`动画帧 t=${t.toFixed(2)}`, 12, 24);
  }

  /** 扩展：GeometryUtil 圆环阵——极坐标计算圆周点，三圈不同密度圆点 */
  static drawDotRing(ctx: CanvasRenderer, w: number, h: number): void {
    LogUtil.info(TAG, '【扩展】GeometryUtil：圆环阵开始');
    const cx: number = w / 2;
    const cy: number = h / 2;
    const base: number = Math.min(w, h);
    const rings: RingSpec[] = [
      { rRatio: 0.12, count: 8, color: '#E53935' } as RingSpec,
      { rRatio: 0.22, count: 16, color: '#FDD835' } as RingSpec,
      { rRatio: 0.32, count: 24, color: '#1E88E5' } as RingSpec
    ];
    for (const ring of rings) {
      const radius: number = base * ring.rRatio;
      ctx.fillStyle = ring.color;
      for (let i = 0; i < ring.count; i++) {
        const p: Point = GeometryUtil.pointOnCircleDeg(cx, cy, radius, i * 360 / ring.count);
        ctx.beginPath();
        ctx.arc(p.x, p.y, base * 0.018, 0, Math.PI * 2);
        ctx.fill();
      }
      LogUtil.info(TAG, `E.5 圆环：半径 ${Math.round(radius)}vp，${ring.count} 个圆点，颜色 ${ring.color}`);
    }
    LogUtil.info(TAG, '【扩展】完成');
  }

  /** 补充：CanvasPattern.setTransform(Matrix2D)——图案本身的矩阵变换（Pattern × Matrix2D 交叉） */
  static drawPatternTransform(ctx: CanvasRenderer, w: number, h: number, bitmap: ImageBitmap): void {
    LogUtil.info(TAG, '【补充】CanvasPattern.setTransform：图案矩阵变换开始');
    const pattern: CanvasPattern | null = ctx.createPattern(bitmap, 'repeat');
    if (pattern === null) {
      LogUtil.error(TAG, 'createPattern 返回 null');
      return;
    }
    // 同一图案三种矩阵：旋转 30° / 缩放 1.5 / 平移，setTransform 只影响图案空间，不影响画布坐标系
    pattern.setTransform(new Matrix2D().identity().rotate(Math.PI / 6));
    ctx.fillStyle = pattern;
    ctx.fillRect(0, 0, w / 3, h);
    LogUtil.info(TAG, 'P.1 区域1：图案旋转 30°（rotate 弧度）');

    pattern.setTransform(new Matrix2D().identity().scale(1.5, 1.5));
    ctx.fillStyle = pattern;
    ctx.fillRect(w / 3, 0, w / 3, h);
    LogUtil.info(TAG, 'P.2 区域2：图案放大 1.5 倍（scale）');

    pattern.setTransform(new Matrix2D().identity().translate(10, 10));
    ctx.fillStyle = pattern;
    ctx.fillRect(w * 2 / 3, 0, w / 3, h);
    LogUtil.info(TAG, 'P.3 区域3：图案平移 (10,10)（translate）');

    ctx.setTransform(new Matrix2D().identity());
    LogUtil.info(TAG, '【补充】完成');
  }

  /** 补充：drawImage 9 参数源矩形裁剪——离屏图四分块贴主画布四角 */
  static drawImageCrop(ctx: CanvasRenderer, w: number, h: number): void {
    LogUtil.info(TAG, '【补充】drawImage 9 参数：源矩形裁剪开始');
    // 生成离屏源图：对角渐变 + 中心圆
    const src: OffscreenCanvas = new OffscreenCanvas(200, 200);
    const srcCtx: OffscreenCanvasRenderingContext2D = src.getContext('2d');
    const grad: CanvasGradient = srcCtx.createLinearGradient(0, 0, 200, 200);
    grad.addColorStop(0, '#E53935');
    grad.addColorStop(1, '#1E88E5');
    srcCtx.fillStyle = grad;
    srcCtx.fillRect(0, 0, 200, 200);
    srcCtx.fillStyle = '#FFEB3B';
    srcCtx.beginPath();
    srcCtx.arc(100, 100, 50, 0, Math.PI * 2);
    srcCtx.fill();
    const bitmap: ImageBitmap = src.transferToImageBitmap();
    // drawImage(bitmap, sx, sy, sw, sh, dx, dy, dw, dh)：源四分块 → 目标四角
    ctx.drawImage(bitmap, 0, 0, 100, 100, 0, 0, w / 2 - 4, h / 2 - 4);
    ctx.drawImage(bitmap, 100, 0, 100, 100, w / 2 + 4, 0, w / 2 - 4, h / 2 - 4);
    ctx.drawImage(bitmap, 0, 100, 100, 100, 0, h / 2 + 4, w / 2 - 4, h / 2 - 4);
    ctx.drawImage(bitmap, 100, 100, 100, 100, w / 2 + 4, h / 2 + 4, w / 2 - 4, h / 2 - 4);
    LogUtil.info(TAG, `P.4 源图 200x200 四分块裁剪后贴主画布四角（${Math.round(w)}x${Math.round(h)}）`);
    LogUtil.info(TAG, '【补充】完成');
  }

  /** 补充：阴影 + 渐变——shadowBlur/shadowColor/shadowOffset 与渐变填充叠加 */
  static drawShadowGradient(ctx: CanvasRenderer, w: number, h: number): void {
    LogUtil.info(TAG, '【补充】阴影 + 渐变开始');
    const grad: CanvasGradient = ctx.createLinearGradient(0, 0, w, 0);
    grad.addColorStop(0, '#7C4DFF');
    grad.addColorStop(1, '#00BCD4');
    // 开启阴影：模糊 18、半透明黑、偏移 (6,6)
    ctx.shadowBlur = 18;
    ctx.shadowColor = 'rgba(0, 0, 0, 0.5)';
    ctx.shadowOffsetX = 6;
    ctx.shadowOffsetY = 6;
    ctx.fillStyle = grad;
    ctx.fillRect(w * 0.08, h * 0.12, w * 0.36, h * 0.3);
    ctx.beginPath();
    ctx.arc(w * 0.72, h * 0.27, Math.min(w, h) * 0.14, 0, Math.PI * 2);
    ctx.fill();
    LogUtil.info(TAG, 'P.5 阴影开启：blur=18，offset=(6,6)，渐变矩形与圆');
    // 关闭阴影后画无阴影对比块
    ctx.shadowBlur = 0;
    ctx.shadowOffsetX = 0;
    ctx.shadowOffsetY = 0;
    ctx.fillStyle = grad;
    ctx.fillRect(w * 0.08, h * 0.58, w * 0.36, h * 0.3);
    LogUtil.info(TAG, 'P.6 阴影关闭：下半区无阴影对比块');
    LogUtil.info(TAG, '【补充】完成');
  }

  /** 补充：filter 滤镜——blur 模糊与清晰渐变对比（filter 属性 since 8） */
  static drawFilterBlur(ctx: CanvasRenderer, w: number, h: number): void {
    LogUtil.info(TAG, '【补充】filter 滤镜开始');
    const grad: CanvasGradient = ctx.createLinearGradient(0, 0, w, 0);
    grad.addColorStop(0, '#E53935');
    grad.addColorStop(1, '#43A047');
    // 上半：blur(4px) 模糊
    ctx.filter = 'blur(4px)';
    ctx.fillStyle = grad;
    ctx.fillRect(w * 0.08, h * 0.1, w * 0.84, h * 0.32);
    LogUtil.info(TAG, 'P.7 filter=blur(4px)：上半区模糊渐变');
    // 下半：恢复 none 清晰对比
    ctx.filter = 'none';
    ctx.fillStyle = grad;
    ctx.fillRect(w * 0.08, h * 0.56, w * 0.84, h * 0.32);
    LogUtil.info(TAG, 'P.8 filter=none：下半区清晰对比');
    LogUtil.info(TAG, '【补充】完成');
  }

  /** 补充：addColorStop 的 ColorMetrics 重载（API 12+）——颜色对象方式设置渐变断点 */
  static drawColorMetricsGradient(ctx: CanvasRenderer, w: number, h: number): void {
    LogUtil.info(TAG, '【补充】addColorStop(ColorMetrics) 重载开始（API 12+）');
    const grad: CanvasGradient = ctx.createLinearGradient(0, 0, w, 0);
    // ColorMetrics.rgba(r, g, b, alpha?)：alpha 可选（0-1）
    grad.addColorStop(0, ColorMetrics.rgba(229, 57, 53));
    grad.addColorStop(0.5, ColorMetrics.rgba(253, 216, 53, 1));
    // ColorMetrics.resourceColor：接受 string/Resource 颜色
    grad.addColorStop(1, ColorMetrics.resourceColor('#1E88E5'));
    ctx.fillStyle = grad;
    ctx.fillRect(0, 0, w, h);
    LogUtil.info(TAG, 'P.9 断点颜色：ColorMetrics.rgba（alpha 可选）与 resourceColor 混用');
    LogUtil.info(TAG, '【补充】完成');
  }
}
