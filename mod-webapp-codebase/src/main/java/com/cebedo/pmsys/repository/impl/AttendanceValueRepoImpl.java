package com.cebedo.pmsys.repository.impl;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.data.redis.core.RedisTemplate;

import com.cebedo.pmsys.domain.Attendance;
import com.cebedo.pmsys.repository.IValueRepository;

public class AttendanceValueRepoImpl implements IValueRepository<Attendance> {

    private RedisTemplate<String, Attendance> redisTemplate;

    public void setRedisTemplate(RedisTemplate<String, Attendance> redisTemplate) {
	this.redisTemplate = redisTemplate;
    }

    @Override
    public void rename(Attendance obj, String newKey) {
	this.redisTemplate.rename(obj.getKey(), newKey);
    }

    @Override
    public void delete(Collection<String> keys) {
	this.redisTemplate.delete(keys);
    }

    @Override
    public void set(Attendance obj) {
	this.redisTemplate.opsForValue().set(obj.getKey(), obj);
    }

    @Override
    public void setIfAbsent(Attendance obj) {
	this.redisTemplate.opsForValue().setIfAbsent(obj.getKey(), obj);
    }

    @Override
    public Attendance get(String key) {
	return this.redisTemplate.opsForValue().get(key);
    }

    @Override
    public Set<String> keys(String pattern) {
	return this.redisTemplate.opsForValue().getOperations().keys(pattern);
    }

    @Override
    public void multiSet(Map<String, Attendance> m) {
	this.redisTemplate.opsForValue().multiSet(m);
    }

    @Override
    public List<Attendance> multiGet(Collection<String> keys) {
	return this.redisTemplate.opsForValue().multiGet(keys);
    }

    @Override
    public void delete(String key) {
	this.redisTemplate.delete(key);
    }

}
