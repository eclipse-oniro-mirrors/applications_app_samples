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

@ComponentV2
export struct ContactAvatar {
  @Param idValue: string = 'id_avatar';
  @Param name: string = '';
  @Param avatarSize: number = 44;

  build() {
    Text(this.name.length > 0 ? this.name.substring(0, 1).toUpperCase() : '#')
      .id(this.idValue)
      .width(this.avatarSize)
      .height(this.avatarSize)
      .textAlign(TextAlign.Center)
      .fontSize(this.avatarSize * 0.4)
      .fontWeight(FontWeight.Medium)
      .fontColor($r('app.color.brand_primary'))
      .backgroundColor($r('app.color.avatar_bg'))
      .borderRadius(this.avatarSize / 2)
  }
}
