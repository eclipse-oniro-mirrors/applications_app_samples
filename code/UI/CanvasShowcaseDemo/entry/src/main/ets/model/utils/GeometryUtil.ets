/**
 * GeometryUtil 几何工具类
 *
 * Canvas 场景常用几何计算：角度弧度互转、圆周点（极坐标转笛卡尔）、
 * 矩形包含判断、数值截断。纯函数、无副作用，便于单元测试。
 */
export interface Point {
  x: number;
  y: number;
}

export class GeometryUtil {
  /** 角度 → 弧度（Matrix2D.rotate 参数为弧度） */
  static degToRad(deg: number): number {
    return deg * Math.PI / 180;
  }

  /** 弧度 → 角度 */
  static radToDeg(rad: number): number {
    return rad * 180 / Math.PI;
  }

  /** 圆周点：angleRad 为弧度，0 指向 x 正方向，顺时针（屏幕坐标系 y 向下） */
  static pointOnCircle(cx: number, cy: number, radius: number, angleRad: number): Point {
    return {
      x: cx + radius * Math.cos(angleRad),
      y: cy + radius * Math.sin(angleRad)
    } as Point;
  }

  /** 圆周点（角度版，内部转弧度） */
  static pointOnCircleDeg(cx: number, cy: number, radius: number, angleDeg: number): Point {
    return GeometryUtil.pointOnCircle(cx, cy, radius, GeometryUtil.degToRad(angleDeg));
  }

  /** 矩形包含判断（含边界） */
  static rectContains(rx: number, ry: number, rw: number, rh: number, px: number, py: number): boolean {
    return px >= rx && px <= rx + rw && py >= ry && py <= ry + rh;
  }

  /** 数值截断到 [min, max] */
  static clamp(v: number, min: number, max: number): number {
    if (v < min) {
      return min;
    }
    if (v > max) {
      return max;
    }
    return v;
  }

  /** 两点距离 */
  static distance(x1: number, y1: number, x2: number, y2: number): number {
    const dx: number = x2 - x1;
    const dy: number = y2 - y1;
    return Math.sqrt(dx * dx + dy * dy);
  }
}
