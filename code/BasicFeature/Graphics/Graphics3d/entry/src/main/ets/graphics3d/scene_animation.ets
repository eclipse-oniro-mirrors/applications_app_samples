/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import scene3d from '@ohos.graphics.scene'
import router from '@ohos.router';
import animator, { AnimatorResult } from '@ohos.animator';
import Logger from '../util/Logger';

@Entry
@Component
struct sceneAnimation {
  scene: scene3d.Scene | null = null;
  @State sceneOpt: SceneOptions | null = null;
  cam: scene3d.Camera | null = null;
  @State progressValue: number = 0;

  @State animationEnabled: Boolean = false;
  @State animationDuration: number = 0;
  @State animationIsRunning: Boolean = false;
  @State animationCallbackInvoked: string = 'no invoked callback'

  backAnimator: AnimatorResult | undefined = undefined;

  onPageShow(): void {
    this.init();
  }

  onPageHide(): void {
    if (this.scene) {
      this.scene.destroy();
    }

    this.cam = null;
    this.scene = null;
  }

  init(): void {
    this.backAnimator = animator.create({
      duration: 2000, // duration
      easing: "ease",
      delay: 0,
      fill: "none",
      direction: "normal",
      iterations: -1, // endless loop
      begin: 100, // begin
      end: 200 // end
    })
    this.backAnimator.onframe = value => {
      if (this.scene?.animations[0]) {
        this.animationEnabled = this.scene.animations[0].enabled;
        this.animationDuration = this.scene.animations[0].duration;
        this.animationIsRunning = this.scene.animations[0].running;
        this.progressValue = this.scene.animations[0].progress;
      }
    }
    if (this.scene === null) {
      scene3d.Scene.load($rawfile("gltf/BrainStem/glTF/BrainStem.glb"))
        .then(async (result: scene3d.Scene) => {
          this.scene = result;
          this.sceneOpt = { scene: this.scene, modelType: ModelType.SURFACE } as SceneOptions;
          let rf = this.scene.getResourceFactory();
          this.cam = await rf.createCamera({ "name": "Camera1" });
          this.cam.enabled = true;
          this.cam.position.z = 5;

          let env = await rf.createEnvironment({ "name": "Env" });
          this.scene.environment.backgroundType = scene3d.EnvironmentBackgroundType.BACKGROUND_IMAGE;
          this.scene.environment.environmentImage = await rf.createImage({ name: "envImg1", uri: $rawfile("gltf/DamagedHelmet/glTF/Default_normal.jpg") });
        })
        .catch((reason: string) => {
          Logger.error("init error", reason);
        });
    }
  }

  build() {
    Row() {
      Column() {
        Column() {
          if (this.sceneOpt) {
            Component3D(this.sceneOpt)
              .renderWidth('60%')
              .renderHeight('60%')
              .onAppear(()=>{
                if (!this.scene || !this.scene.animations[0]) {
                  return;
                }
                let count = this.scene.animations.length;

                let anim: scene3d.Animation = this.scene.animations[0];
                anim.onStarted(()=>{
                  this.animationCallbackInvoked = 'animation on start'
                });
                anim.onFinished(() => {
                  this.animationCallbackInvoked = 'animation on finish'
                });
                this.backAnimator?.play();
              })
          }
          else {
            Text("loading 1...");
          }
        }
        .height('30%')

        Row() {
          Text ("progress: " + (this.progressValue * 100).toFixed(2) + '%')
        }
        Text("Duration: " + this.animationDuration.toFixed(2) + "S");
        Text("Running: " + this.animationIsRunning);
        Text("enabled: " + this.animationEnabled);

        Text("animation invoked callback:" + this.animationCallbackInvoked);

        Button('enable animation').onClick(() => {
          if (!this.scene || !this.scene.animations[0]) {
            return;
          }

          this.scene.animations[0].enabled = !this.scene.animations[0].enabled;
        }).id('enable_animation');
        
        Button('start').onClick(async () => {
          if (!this.scene || !this.scene.animations[0]) {
            return;
          }
          let anim: scene3d.Animation = this.scene.animations[0];
          anim.start();
        }).id('start_animation');

        Button('pause').onClick(async () => {
          if (!this.scene || !this.scene.animations[0]) {
            return;
          }
          let anim: scene3d.Animation = this.scene.animations[0];
          anim.pause();
        }).id('pause_animation');

        Button('stop').onClick(async () => {
          if (!this.scene || !this.scene.animations[0]) {
            return;
          }
          let anim: scene3d.Animation = this.scene.animations[0];
          anim.stop();
        }).id('stop_animation');

        Button('finish').onClick(async () => {
          if (!this.scene || !this.scene.animations[0]) {
            return;
          }
          let anim: scene3d.Animation = this.scene.animations[0];
          anim.finish();
        }).id('finish_animation');

        Button('restart').onClick(async () => {
          if (!this.scene || !this.scene.animations[0]) {
            return;
          }
          let anim: scene3d.Animation = this.scene.animations[0];
          anim.restart();
        }).id('restart_animation');

        Button('seek to 30% progress').onClick(async () => {
          if (!this.scene || !this.scene.animations[0]) {
            return;
          }
          let anim: scene3d.Animation = this.scene.animations[0];
          // seek to 30%
          anim.seek(0.3);
        }).id('seek_animation');

        Button('back').onClick(() => {
          router.back()
        }).id('back_animation')
      }
      .width('100%')
    }
    .height('100%')
  }
}