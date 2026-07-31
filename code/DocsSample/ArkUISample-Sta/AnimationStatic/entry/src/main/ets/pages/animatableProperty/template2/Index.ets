'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [Start Animation_AnimatableProperty]
import { Polyline, PolylineAttribute, Curve, AnimatableArithmetic, AnimatableExtend, Row, Column, Entry, Component, ClickEvent, FlexAlign, State, ShapePoint, Color } from '@kit.ArkUI';

declare type Point = Double[];

// 定义可动画属性接口的参数类型，实现AnimatableArithmetic<T>接口中加法、减法、乘法和判断相等函数
class PointClass extends Array<Double> {
  constructor(value: Point) {
    super(value[0], value[1]);
  }

  add(rhs: PointClass): PointClass {
    let result: Point = new Array<Double>() as Point;
    for (let i = 0; i < 2; i++) { // 2: 二维坐标点
      result.push(rhs[i] + this[i]);
    }
    return new PointClass(result);
  }

  subtract(rhs: PointClass): PointClass {
    let result: Point = new Array<Double>() as Point;
    for (let i = 0; i < 2; i++) { // 2: 二维坐标点
      result.push(this[i] - rhs[i]);
    }
    return new PointClass(result);
  }

  multiply(scale: Double): PointClass {
    let result: Point = new Array<Double>() as Point;
    for (let i = 0; i < 2; i++) { // 2: 二维坐标点
      result.push(this[i] * scale);
    }
    return new PointClass(result);
  }
}

// 定义可动画属性接口的参数类型，实现AnimatableArithmetic<T>接口中加法、减法、乘法和判断相等函数
// 模板T支持嵌套实现AnimatableArithmetic<T>的类型
class PointVector extends Array<PointClass> implements AnimatableArithmetic<PointVector> {
  constructor(initialValue: Array<Point>) {
    super();
    if (initialValue.length) {
      initialValue.forEach((p: Point) => { this.push(new PointClass(p)); });
    }
  }

  // implement the IAnimatableArithmetic interface
  plus(rhs: AnimatableArithmetic<PointVector>): PointVector {
    let result = new PointVector([]);
    let rhsVec = rhs as PointVector;
    const len = Math.min(this.length, rhsVec.length);
    for (let i = 0; i < len; i++) {
      result.push(this[i].add(rhsVec[i]));
    }
    return result;
  }

  subtract(rhs: AnimatableArithmetic<PointVector>): PointVector {
    let result = new PointVector([]);
    let rhsVec = rhs as PointVector;
    const len = Math.min(this.length, rhsVec.length);
    for (let i = 0; i < len; i++) {
      result.push(this[i].subtract(rhsVec[i]));
    }
    return result;
  }

  multiply(scale: Double): PointVector {
    let result = new PointVector([]);
    for (let i = 0; i < this.length; i++) {
      result.push(this[i].multiply(scale));
    }
    return result;
  }

  equals(rhs: AnimatableArithmetic<PointVector>): Boolean {
    let rhsVec = rhs as PointVector;
    if (this.length !== rhsVec.length) {
      return false;
    }
    for (let index = 0, size = this.length; index < size; ++index) {
      if (this[index][0] !== rhsVec[index][0] || this[index][1] !== rhsVec[index][1]) {
        return false;
      }
    }
    return true;
  }

  get(): Array<ShapePoint> {
    let result: Array<ShapePoint> = [];
    this.forEach((p: PointClass) => { result.push([p[0], p[1] as Double]); });
    return result;
  }
}

// 自定义可动画属性接口
@AnimatableExtend
function animatablePoints(this: PolylineAttribute, points: PointVector): PolylineAttribute {
  this.points(points.get() as Array<ShapePoint>);
  return this;
}

@Entry
@Component
struct AnimatedShape {
  squareStartPointX: Double = 75; // 75: 正方形起始点X坐标
  squareStartPointY: Double = 25; // 25: 正方形起始点Y坐标
  squareWidth: Double = 150; // 150: 正方形宽度
  squareEndTranslateX: Double = 50; // 50: 正方形结束位置X轴平移量
  squareEndTranslateY: Double = 50; // 50: 正方形结束位置Y轴平移量
  @State pointVec1: PointVector = new PointVector([
    [this.squareStartPointX, this.squareStartPointY],
    [this.squareStartPointX + this.squareWidth, this.squareStartPointY],
    [this.squareStartPointX + this.squareWidth, this.squareStartPointY + this.squareWidth],
    [this.squareStartPointX, this.squareStartPointY + this.squareWidth]
  ]);
  @State pointVec2: PointVector = new PointVector([
    [this.squareStartPointX + this.squareEndTranslateX, this.squareStartPointY + this.squareStartPointY],
    [this.squareStartPointX + this.squareWidth + this.squareEndTranslateX,
      this.squareStartPointY + this.squareStartPointY],
    [this.squareStartPointX + this.squareWidth, this.squareStartPointY + this.squareWidth],
    [this.squareStartPointX, this.squareStartPointY + this.squareWidth]
  ]);
  @State color: Color = Color.Green;
  @State fontSize: Double = 20.0; // 20.0: 字体大小
  @State polyline1Vec: PointVector = this.pointVec1;
  @State polyline2Vec: PointVector = this.pointVec2;

  build(): void {
    Row(undefined) {
      Polyline(undefined)
        .width(300) // 300: 折线宽度
        .height(200) // 200: 折线高度
        .backgroundColor('#0C000000') // 0C000000: 背景颜色（黑色带透明度）
        .fill('#317AF7') // 317AF7: 填充颜色（蓝色）
        .animatablePoints(this.polyline1Vec)
        .animation({ duration: 2000, delay: 0, curve: Curve.Ease }) // 2000: 动画持续时间（毫秒），0: 动画延迟时间
        .onClick(() => {
          if (this.polyline1Vec.equals(this.pointVec1)) {
            this.polyline1Vec = this.pointVec2;
          } else {
            this.polyline1Vec = this.pointVec1;
          }
        })
    }
    .width('100%').height('100%').justifyContent(FlexAlign.Center)
  }
}

// [End Animation_AnimatableProperty]
