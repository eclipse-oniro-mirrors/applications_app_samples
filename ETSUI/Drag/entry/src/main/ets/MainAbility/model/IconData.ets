/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

export class Icon {
  icon: Resource
  name: Resource

  constructor(icon: Resource, name: Resource) {
    this.icon = icon
    this.name = name
  }
}

export function iconInit(): Array<Icon> {
  let iconList = [
    { icon: $r('app.media.call'), name: $r('app.string.phone') },
    { icon: $r('app.media.mms'), name: $r('app.string.message') },
    { icon: $r('app.media.music'), name: $r('app.string.music') },
    { icon: $r('app.media.notes'), name: $r('app.string.note') },
    { icon: $r('app.media.camera'), name: $r('app.string.camera') },
    { icon: $r('app.media.video'), name: $r('app.string.photo') }
  ]
  return iconList
}


