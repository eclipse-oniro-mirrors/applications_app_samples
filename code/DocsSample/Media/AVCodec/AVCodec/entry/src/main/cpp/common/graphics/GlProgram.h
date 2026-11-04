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

#ifndef AVCODEC_GL_PROGRAM_H
#define AVCODEC_GL_PROGRAM_H
#include <GLES2/gl2.h>

namespace AvCodecGraphics {
inline GLuint CompileShader(GLenum type, const char *source)
{
    const GLuint shader = glCreateShader(type);
    if (shader == 0) { return 0; }
    glShaderSource(shader, 1, &source, nullptr);
    glCompileShader(shader);
    GLint compiled = GL_FALSE;
    glGetShaderiv(shader, GL_COMPILE_STATUS, &compiled);
    if (compiled == GL_TRUE) { return shader; }
    glDeleteShader(shader);
    return 0;
}

inline GLuint LinkProgram(GLuint vertex, GLuint fragment)
{
    const GLuint program = glCreateProgram();
    if (program == 0) {
        return 0;
    }
    glAttachShader(program, vertex);
    glAttachShader(program, fragment);
    glLinkProgram(program);
    GLint linked = GL_FALSE;
    glGetProgramiv(program, GL_LINK_STATUS, &linked);
    if (linked == GL_TRUE) {
        return program;
    }
    glDeleteProgram(program);
    return 0;
}

inline void DeleteShaders(GLuint vertex, GLuint fragment)
{
    if (vertex != 0) { glDeleteShader(vertex); }
    if (fragment != 0) { glDeleteShader(fragment); }
}

inline GLuint CreateProgram(const char *vertexSource, const char *fragmentSource)
{
    const GLuint vertex = CompileShader(GL_VERTEX_SHADER, vertexSource);
    const GLuint fragment = CompileShader(GL_FRAGMENT_SHADER, fragmentSource);
    if (vertex == 0 || fragment == 0) {
        DeleteShaders(vertex, fragment);
        return 0;
    }
    const GLuint program = LinkProgram(vertex, fragment);
    DeleteShaders(vertex, fragment);
    return program;
}
}
#endif
