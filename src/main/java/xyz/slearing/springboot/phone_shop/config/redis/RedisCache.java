package xyz.slearing.springboot.phone_shop.config.redis;

import org.apache.ibatis.cache.Cache;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/**
 * @Author slearing
 */
public class RedisCache implements Cache {
    private static final Logger logger = LoggerFactory.getLogger(RedisCache.class);
    private final ReadWriteLock readWriteLock = new ReentrantReadWriteLock();
    private final String id;
    private RedisTemplate redisTemplate;
    private static final long EXPIRE_TIME_IN_MINUTES = 30;

    public RedisCache(String id){
        this.id = id;
    }

    @Override
    public String getId() {
        if(id == null || "".equals(id)){
            try {
                throw new Exception("id为空");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return id;
    }

    @Override
    public void putObject(Object o, Object o1) {
        if(redisTemplate == null){
            getRedisTemplate();
        }
        ValueOperations valueOperations = redisTemplate.opsForValue();
        valueOperations.set(o , o1 , EXPIRE_TIME_IN_MINUTES , TimeUnit.MINUTES);
        logger.info("新建key - value 成功！");
    }

    @Override
    public Object getObject(Object o) {
        if(redisTemplate == null){
            getRedisTemplate();
        }
        ValueOperations valueOperations = redisTemplate.opsForValue();
        Object value = valueOperations.get(o);
        logger.info("查询key成功！");

        return value;

    }

    @Override
    public Object removeObject(Object o) {
        if(redisTemplate == null){
            getRedisTemplate();
        }
        Boolean aBoolean = redisTemplate.delete(o);
        logger.info("删除key成功！");

        return aBoolean;
    }

    @Override
    public void clear() {
        if(redisTemplate == null){
            getRedisTemplate();
        }

        redisTemplate.execute((RedisCallback) connection -> {
            connection.flushDb();
            return null;
        });
        logger.debug("Clear all the cached query result from redis");
    }
    @Override
    public int getSize() {
        return 0;
    }
    @Override
    public ReadWriteLock getReadWriteLock() {
        return readWriteLock;
    }

    public void getRedisTemplate(){
        this.redisTemplate = ApplicationContextHolder.getBean("redisTemplate");
    }
}
