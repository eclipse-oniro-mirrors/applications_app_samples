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

import { Scene } from 'room';

/**
 * Horizontal bar listing runnable scenes as buttons.
 * All buttons are disabled while a run is in progress.
 */
@ComponentV2
export struct SceneBar {
  /** Scenes rendered by the bar. */
  @Param scenes: Scene[] = [];
  /** When true, a run is in progress and buttons are disabled. */
  @Param running: boolean = false;
  /** Fired when the user taps a scene button. */
  @Event onRun: (sceneId: string) => void = (sceneId: string): void => {};

  /** Renders the horizontal scene list. */
  build() {
    List({ space: '8vp' }) {
      Repeat<Scene>(this.scenes)
        .each((item: RepeatItem<Scene>) => {
          ListItem() {
            Button(this.running ? $r('app.string.executing') : item.item.name)
              .id('id_scene_' + item.item.id)
              .height('36vp')
              .padding({ left: '16vp', right: '16vp' })
              .fontSize($r('app.float.caption_font'))
              .fontColor(Color.White)
              .backgroundColor($r('app.color.accent'))
              .borderRadius('18vp')
              // Dim and disable the button while another run is in progress.
              .opacity(this.running ? 0.5 : 1)
              .enabled(!this.running)
              .onClick(() => {
                this.onRun(item.item.id);
              })
          }
          .id('id_scene_item_' + item.item.id)
        })
        .key((item: Scene): string => item.id)
    }
    .id('id_scene_bar')
    .width('100%')
    .height('40vp')
    .listDirection(Axis.Horizontal)
    .scrollBar(BarState.Off)
  }
}
