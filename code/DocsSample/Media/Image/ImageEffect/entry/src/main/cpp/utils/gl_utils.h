/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef IMAGEEFFECT_GL_UTILS_H
#define IMAGEEFFECT_GL_UTILS_H

#include <GLES3/gl3.h>
#include <cstdint>
#include <vector>

class GLUtils {
public:
    // 创建2D纹理，返回纹理ID。
    static GLuint CreateTexture2D(int width, int height, int levels, GLenum internalFormat);

    // 删除纹理。
    static void DeleteTexture(GLuint textureId);

    // 将纹理内容回读到RGBA8888像素数据。
    static bool ReadTextureToRgba(GLuint textureId, int width, int height, std::vector<uint8_t> &pixels);
};

#endif // IMAGEEFFECT_GL_UTILS_H
