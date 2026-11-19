/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

/**
 * @file entry/src/main/ets/pages/components/informationPresentationAndDynamicEffects/particleSample/ParticleSample.ets
 * 文件职责：ParticleSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：TrackSpawnReturn、Point、ParticleEngine、ParticleSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';

/**
 * TrackSpawnReturn：类定义，承载本文件对应的逻辑与数据。
 */
class TrackSpawnReturn {
  x?: number;
  y?: number;
  d: number = 0.0;
}

/**
 * Point：类定义，承载本文件对应的逻辑与数据。
 */
class Point {
  x: number = 0.0;
  y: number = 0.0;
  vy: number = 0.0;
  z: number = 0.0;
  radius: number = 0.0;
  color: number = 0.0;
  distance: number = 0.0;
}

/**
 * ParticleEngine：类定义，承载本文件对应的逻辑与数据。
 */
class ParticleEngine {
  ctx!: CanvasRenderingContext2D;
  width: number = 0;
  height: number = 0;
  frameNo: number = 0;

  // canvas x
  camX: number = 0;

  // canvas y
  camY: number = 0;

  // canvas analog z
  camZ: number = 0;

  // particle curve rate of its orbits
  pitch: number = 0.0;
  yaw: number = 0;

  // central axis of canvas width
  cx: number = 0.0;

  // central axis of canvas height
  cy: number = 0.0;

  // particle orbits generation scale
  scale: number = 0;

  points:Array<Point> = [];

  // max particles to be generated
  initParticles: number = 0;

  // y shifting rate for each frame
  initV: number = 0.0;

  // max particles generation radius
  distributionRadius: number = 0;

  // vortex generated height
  vortexHeight: number = 0;
}

let sampleParticleEngine: ParticleEngine = new ParticleEngine();

/**
 * ParticleSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ParticleSample {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private spawn: boolean = false;
  private interval: number = 0;

  /**
   * elevation：执行 elevation 相关逻辑。
   */
  elevation(x: number, y: number, z: number) {
    let distance = Math.sqrt(x * x + y * y + z * z);
    // 分支：if (distance && z / distance >= -1 && z / distance <= 1){
    if (distance && z / distance >= -1 && z / distance <= 1){
      return Math.acos(z / distance);
    }
    return 0.00000001;
  }

  /**
   * rgb：执行 rgb 相关逻辑。
   */
  rgb(colorRGBData: number) {
    colorRGBData += 0.000001;
    // generate rgb value by random for particles
    let r = Math.round((0.5 + Math.sin(colorRGBData) * 0.5) * 16);
    let g = Math.round((0.5 + Math.cos(colorRGBData) * 0.5) * 16);
    let b = Math.round((0.5 - Math.sin(colorRGBData) * 0.5) * 16);
    return '#' + r.toString(16) + g.toString(16) + b.toString(16);
  }

  /**
   * interpolateColors：执行 interpolateColors 相关逻辑。
   */
  interpolateColors(RGB1: number[], RGB2: number[], degree: number) {
    let w2: number = degree;
    let w1: number = 1 - w2;
    return [w1 * RGB1[0] + w2 * RGB2[0], w1 * RGB1[1] + w2 * RGB2[1], w1 * RGB1[2] + w2 * RGB2[2]];
  }

  /**
   * rgbArray：执行 rgbArray 相关逻辑。
   */
  rgbArray(colorRGBData: number) {
    colorRGBData += 0.000001;
    // generate rgb value by random for particles and returned as an array
    let r = Math.round((0.5 + Math.sin(colorRGBData) * 0.5) * 256);
    let g = Math.round((0.5 + Math.cos(colorRGBData) * 0.5) * 256);
    let b = Math.round((0.5 - Math.sin(colorRGBData) * 0.5) * 256);
    return [r, g, b];
  }

  /**
   * colorString：执行 colorString 相关逻辑。
   */
  colorString(colorArray: number[]) {
    // generate rgb value by random with a generated rgb array for particles and returned as a string
    let r = Math.round(colorArray[0]);
    let g = Math.round(colorArray[1]);
    let b = Math.round(colorArray[2]);
    return '#' + ('0' + r.toString(16)).slice(-2) + ('0' + g.toString(16)).slice(-2) + ('0' + b.toString(16)).slice(-2);
  }

  /**
   * particleEnginePerform：执行 particleEnginePerform 相关逻辑。
   */
  particleEnginePerform(particleEngine: ParticleEngine) {
    // 分支：if (particleEngine.points.length < particleEngine.initPartic
    if (particleEngine.points.length < particleEngine.initParticles) {
      // 分支：for (let i = 0; i < 5; ++i) {
      for (let i = 0; i < 5; ++i) {
        // 处理：this.particleItemSpawn(particleEngine);
        this.particleItemSpawn(particleEngine);
      // 结束当前组件块
      }
    }
    let p: number, d: number, t: number;

    // generate particle move path for animation which is a spiral orbit
    p = Math.atan2(particleEngine.camX, particleEngine.camZ);
    d = Math.sqrt(particleEngine.camX * particleEngine.camX + particleEngine.camZ * particleEngine.camZ);
    // move by each frame
    d -= Math.sin(particleEngine.frameNo / 80) / 25;
    t = Math.cos(particleEngine.frameNo / 300) / 165;
    particleEngine.camX = Math.sin(p + t) * d;
    particleEngine.camZ = Math.cos(p + t) * d;
    particleEngine.camY = -Math.sin(particleEngine.frameNo / 220) * 15;
    particleEngine.yaw = Math.PI + p + t;
    particleEngine.pitch = this.elevation(particleEngine.camX, particleEngine.camZ, particleEngine.camY) - Math.PI / 2;

    let x: number, y: number, z: number;
    // 分支：for (let i = 0; i < particleEngine.points.length; ++i) {
    for (let i = 0; i < particleEngine.points.length; ++i) {
      // 处理：x = particleEngine.points[i].x;
      x = particleEngine.points[i].x;
      // 处理：y = particleEngine.points[i].y;
      y = particleEngine.points[i].y;
      // 处理：z = particleEngine.points[i].z;
      z = particleEngine.points[i].z;
      // distance between particles, 1.0075 is the justify number
      d = Math.sqrt(x * x + z * z) / 1.0075;
      // 处理：t = 0.1 / (1 + d * d / 5);
      t = 0.1 / (1 + d * d / 5);
      // 处理：p = Math.atan2(x, z) + t;
      p = Math.atan2(x, z) + t;
      // 处理：particleEngine.points[i].x = Math.sin(p) * d;
      particleEngine.points[i].x = Math.sin(p) * d;
      // 处理：particleEngine.points[i].z = Math.cos(p) * d;
      particleEngine.points[i].z = Math.cos(p) * d;
      // 处理：particleEngine.points[i].y += particleEngine.poi
      particleEngine.points[i].y += particleEngine.points[i].vy * t * ((Math.sqrt(particleEngine.distributionRadius) - d) * 2);
      // 分支：if (particleEngine.points[i].y > particleEngine.vortexHeight
      if (particleEngine.points[i].y > particleEngine.vortexHeight / 2 || d < 0.25) {
        // 处理：particleEngine.points.splice(i, 1);
        particleEngine.points.splice(i, 1);
        // 处理：this.particleItemSpawn(particleEngine);
        this.particleItemSpawn(particleEngine);
      // 结束当前组件块
      }
    }
  }

  // TrackSpawn：TrackSpawn 自定义组件
  /**
   * TrackSpawn：执行 TrackSpawn 相关逻辑。
   */
  TrackSpawn(x: number, y: number, z: number, particleEngine: ParticleEngine): TrackSpawnReturn {
    let p: number, d: number;
    x -= particleEngine.camX;
    y -= particleEngine.camY - 8;
    z -= particleEngine.camZ;
    p = Math.atan2(x, z);
    d = Math.sqrt(x * x + z * z);
    x = Math.sin(p - particleEngine.yaw) * d;
    z = Math.cos(p - particleEngine.yaw) * d;
    p = Math.atan2(y, z);
    d = Math.sqrt(y * y + z * z);
    y = Math.sin(p - particleEngine.pitch) * d;
    z = Math.cos(p - particleEngine.pitch) * d;
    let rx1 = -1000;
    let ry1 = 1;
    let rx2 = 1000;
    let ry2 = 1;
    let rx3 = 0;
    let ry3 = 0;
    let rx4 = x;
    let ry4 = z;
    let uc = (ry4 - ry3) * (rx2 - rx1) - (rx4 - rx3) * (ry2 - ry1);
    let ua = ((rx4 - rx3) * (ry1 - ry3) - (ry4 - ry3) * (rx1 - rx3)) / uc;
    let ub = ((rx2 - rx1) * (ry1 - ry3) - (ry2 - ry1) * (rx1 - rx3)) / uc;
    // 分支：if (!z) {
    if (!z) {
      // 处理：z = 0.000000001;
      z = 0.000000001;
    }
    // 分支：if (ua > 0 && ua < 1 && ub > 0 && ub < 1) {
    if (ua > 0 && ua < 1 && ub > 0 && ub < 1) {
      return {
        x: particleEngine.cx + (rx1 + ua * (rx2 - rx1)) * particleEngine.scale,
        y: particleEngine.cy + y / z * particleEngine.scale,
        d: (x * x + y * y + z * z)
      // 结束当前组件块
      };
    } else {
      return { d: -1 };
    }
  }

  /**
   * sortMethod：执行 sortMethod 相关逻辑。
   */
  sortMethod(a: Point, b: Point) {
    return b.distance - a.distance;
  }

  /**
   * particleSpawn：执行 particleSpawn 相关逻辑。
   */
  particleSpawn(particleEngine: ParticleEngine) {
    particleEngine.ctx.globalAlpha = 0.15;
    particleEngine.ctx.fillStyle = '#000';
    particleEngine.ctx.globalCompositeOperation = 'source-over';
    particleEngine.ctx.fillRect(0, 0, particleEngine.width, particleEngine.height);

    let point: TrackSpawnReturn, x: number, y: number, z: number, a: number, size: number, d: number;
    // 分支：for (let i = 0; i < particleEngine.points.length; ++i) {
    for (let i = 0; i < particleEngine.points.length; ++i) {
      // 处理：x = particleEngine.points[i].x;
      x = particleEngine.points[i].x;
      // 处理：y = particleEngine.points[i].y;
      y = particleEngine.points[i].y;
      z = particleEngine.points[i].z;
      point = this.TrackSpawn(x, y, z, particleEngine);
      if (point.d !== -1) {
        particleEngine.points[i].distance = point.d;
        size = 1 + particleEngine.points[i].radius / (1 + point.d);
        d = Math.abs(particleEngine.points[i].y);
        a = 0.8 - Math.pow(d / (particleEngine.vortexHeight / 2), 1000) * 0.8;
        particleEngine.ctx.globalAlpha = a >= 0 && a <= 1 ? a : 0;
        particleEngine.ctx.fillStyle = this.rgb(particleEngine.points[i].color);
        if (point.x !== undefined && point.y !== undefined && point.x > -1 && point.x < particleEngine.width && point.y > -1 && point.y < particleEngine.height) {
          particleEngine.ctx.fillRect(point.x - size / 2, point.y - size / 2, size, size);
        }
      }
    }
    particleEngine.points.sort(this.sortMethod);
  }

  /**
   * particleItemSpawn：执行 particleItemSpawn 相关逻辑。
   */
  particleItemSpawn(particleEngine: ParticleEngine) {
    let p: number;
    let ls: number;
    let pt: Point = {
      x: 0.0,
      y: 0.0,
      vy: 0.0,
      z: 0.0,
      radius: 0.0,
      color: 0.0,
      distance: 0.0
    };
    // vortex points x, y, z(analog) values generation
    p = Math.PI * 2 * Math.random();
    ls = Math.sqrt(Math.random() * particleEngine.distributionRadius);
    pt.x = Math.sin(p) * ls;
    pt.y = -particleEngine.vortexHeight / 2;
    pt.vy = particleEngine.initV / 20 + Math.random() * particleEngine.initV;
    pt.z = Math.cos(p) * ls;
    pt.radius = 200 + 800 * Math.random();
    pt.color = pt.radius / 1000 + particleEngine.frameNo / 250;
    particleEngine.points.push(pt);
  }

  /**
   * init：执行 init 相关逻辑。
   */
  init(particleEngine: ParticleEngine) {
    particleEngine.ctx = this.context;
    particleEngine.width = this.context.width;
    particleEngine.height = this.context.height;
    particleEngine.frameNo = 0;

    // canvas x
    particleEngine.camX = 0;
    // canvas y
    particleEngine.camY = 0;
    // canvas analog z
    particleEngine.camZ = -14;
    // particle curve rate of its orbits
    particleEngine.pitch = this.elevation(particleEngine.camX, particleEngine.camZ, particleEngine.camY) - Math.PI / 2;
    particleEngine.yaw = 0;
    // central axis of canvas width
    particleEngine.cx = particleEngine.width / 2;
    // central axis of canvas height
    particleEngine.cy = particleEngine.height / 2;
    // particle orbits generation scale
    particleEngine.scale = 500;

    particleEngine.points = [];
    // max particles to be generated
    particleEngine.initParticles = 80;
    // y shifting rate for each frame
    particleEngine.initV = 0.01;
    // max particles generation radius
    particleEngine.distributionRadius = 800;
    // vortex generated height
    particleEngine.vortexHeight = 25;
  }

  /**
   * particleFrameGenerate：执行 particleFrameGenerate 相关逻辑。
   */
  particleFrameGenerate(particleEngine: ParticleEngine) {
    particleEngine.frameNo++;
    this.particleEnginePerform(particleEngine);
    this.particleSpawn(particleEngine);
  }

  /**
   * animationOn：执行 animationOn 相关逻辑。
   */
  animationOn() {
    this.interval = setInterval(() => {
      this.particleFrameGenerate(sampleParticleEngine);
    }, 20);
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build(){
    // Column：垂直布局容器
    // 关键属性：背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.particle_effect') }).id('particle_sample_title_bar_3');
      // Column：垂直布局容器
      // 关键属性：内边距、外边距、圆角、宽度、背景色、高度
      Column() {
        // Canvas：画布
        // 关键属性：宽度、高度、圆角、背景色
        Canvas(this.context).id('particle_sample_canvas_5')
          .width('90%')
          .height('90%')
          .borderRadius(24)
          .backgroundColor(Color.Black);
      }.id('particle_sample_column_4')
      .padding(12)
      .margin({ left: 12, right: 12, top: 24, bottom: 24 })
      .borderRadius(24)
      .width('90%')
      .backgroundColor(Color.Black)
      .height('70%');

      // Grid：网格容器
      // 关键属性：columnsTemplate、列间距、内边距、宽度
      Grid() {
        // GridItem：网格项
        GridItem() {
          // Button：按钮
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Button($r('app.string.particle_spawn')).id('particle_sample_button_8')
            .onClick(() => {
              if (this.spawn !== true) {
                this.init(sampleParticleEngine);
                this.animationOn();
                this.spawn = true;
              }
            })
            .width('100%');
        }.id('particle_sample_grid_item_7')

        // GridItem：网格项
        GridItem() {
          // Button：按钮
          // 关键属性：点击事件回调
          // 交互：可点击交互
          Button($r('app.string.particle_spawn_stop')).id('particle_sample_button_10')
            .onClick(() => {
              this.spawn = false;
              clearInterval(this.interval);
            })
            .width('100%');
        }.id('particle_sample_grid_item_9')
      }.id('particle_sample_grid_6')
      .columnsTemplate('1fr 1fr')
      .columnsGap(12)
      .padding({ left: 24, right: 24, bottom: 24 })
      .width('100%');
    }.id('particle_sample_column_2')
    .backgroundColor($r('app.color.background_shallow_grey'));
  }

  /**
   * aboutToDisappear：组件即将销毁时回调，用于释放资源与取消订阅。
   */
  aboutToDisappear() {
    clearInterval(this.interval);
  }
}