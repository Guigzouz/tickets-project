import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { InjectDataSource } from '@nestjs/typeorm';
import { DataSource } from 'typeorm';

@Controller('project')
export class ProjectController {
  constructor(@InjectDataSource() private bdd: DataSource) {}

  @Post()
  create(@Body() createProjectDto) {
    return "hello";
  }

  @Get()
  findAll() {
    return this.bdd.query("SELECT...");
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return "hello";
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateProjectDto) {
    return "hello";
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return "hello";
  }
}
