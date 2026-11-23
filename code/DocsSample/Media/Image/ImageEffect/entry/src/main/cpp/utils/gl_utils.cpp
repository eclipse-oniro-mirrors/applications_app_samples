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

#include "gl_utils.h"

#include <cstddef>

#include "common_utils.h"

constexpr int RGBA_BYTES = 4;

GLuint GLUtils::CreateTexture2D(int width, int height, int levels, GLenum internalFormat)
{
    GLuint textureId = 0;
    glGenTextures(1, &textureId);
    glBindTexture(GL_TEXTURE_2D, textureId);
    glTexStorage2D(GL_TEXTURE_2D, levels, internalFormat, width, height);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glBindTexture(GL_TEXTURE_2D, GL_NONE);
    return textureId;
}

void GLUtils::DeleteTexture(GLuint textureId)
{
    if (textureId == 0) {
        return;
    }
    glDeleteTextures(1, &textureId);
}

bool GLUtils::ReadTextureToRgba(GLuint textureId, int width, int height, std::vector<uint8_t> &pixels)
{
    if (textureId == 0 || width <= 0 || height <= 0) {
        return false;
    }

    GLuint frameBuffer = 0;
    glGenFramebuffers(1, &frameBuffer);
    CHECK_AND_RETURN_RET_LOG(frameBuffer != 0, false, "glGenFramebuffers fail!");
    glBindFramebuffer(GL_FRAMEBUFFER, frameBuffer);
    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, textureId, 0);

    bool result = false;
    if (glCheckFramebufferStatus(GL_FRAMEBUFFER) == GL_FRAMEBUFFER_COMPLETE) {
        pixels.resize(static_cast<size_t>(width) * static_cast<size_t>(height) * RGBA_BYTES);
        // 等待GPU完成纹理渲染后再回读，避免读到未写入完成的数据。
        glFinish();
        glPixelStorei(GL_PACK_ALIGNMENT, 1);
        glReadPixels(0, 0, width, height, GL_RGBA, GL_UNSIGNED_BYTE, pixels.data());
        result = true;
    } else {
        LOG_E("glCheckFramebufferStatus is not complete!");
    }

    glBindFramebuffer(GL_FRAMEBUFFER, GL_NONE);
    glDeleteFramebuffers(1, &frameBuffer);
    return result;
}
