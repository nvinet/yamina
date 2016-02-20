import express from 'express';
import roomsData from '../data/rooms.json';
import galleryData from '../data/gallery.json';

const router = express.Router();

/* GET home page. */
router.get('/', (req, res) => {
  res.render('index', {
    name: 'home'
  });
});

router.get('/riad', (req, res) => {
  res.render('riad', {
    name: 'riad'
  });
});

router.get('/rooms', (req, res) => {
  res.render('rooms', {
    name: 'rooms',
    rooms: roomsData.rooms.sort((a,b) => a.priceMin > b.priceMin)
  });
});

router.get('/services', (req, res) => {
  res.render('services', {
    name: 'services'
  });
});

router.get('/gallery', (req, res) => {
  res.render('gallery', {
    name: 'gallery',
    gallery: galleryData.gallery,
    isActive: (idx) => idx === 0
  });
});

router.get('/contact', (req, res) => {
  res.render('contact', {
    name: 'contact'
  });
});

router.get('/terms', (req, res) => {
  res.render('terms', {
    name: 'terms'
  });
});

export default router;
