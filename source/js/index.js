const vCards = {
    preloader: function () {
        var tl = anime.timeline({});
        tl
            .add({
                targets: '.preloader',
                duration: 1,
                opacity: 1
            })
            .add({
                targets: '.circle-pulse',
                duration: 300,
                //delay: 500,
                opacity: 1,
                zIndex: '-1',
                easing: 'easeInOutQuart'
            }, '+=500')
            .add({
                targets: '.preloader__progress span',
                duration: 500,
                width: '100%',
                easing: 'easeInOutQuart'
            }, '-=500')
            .add({
                targets: '.preloader',
                duration: 500,
                opacity: 0,
                zIndex: '-1',
                easing: 'easeInOutQuart'
            });
    },
    progressBar: function () {
        $('.progress').each(function () {
            var ctrl = new ScrollMagic.Controller();
            new ScrollMagic.Scene({
                triggerElement: '.progress',
                triggerHook: 'onEnter',
                duration: 300
            })
                .addTo(ctrl)
                .on("enter", function (e) {
                    var progressBar = $('.progress-bar');
                    progressBar.each(function (indx) {
                        $(this).css({ 'width': $(this).attr('aria-valuenow') + '%', 'z-index': '2' });
                    });
                });
        });
    },
    LazyLoad: function () {
        lazySizes.init();
    },
    activeStickyKit: function () {
        $('.sticky-column').stick_in_parent({
            parent: '.sticky-parent'
        });

        // bootstrap col position
        $('.sticky-column')
            .on('sticky_kit:bottom', function (e) {
                $(this).parent().css('position', 'static');
            })
            .on('sticky_kit:unbottom', function (e) {
                $(this).parent().css('position', 'relative');
            });
  
    },
    detachStickyKit: function () {
        $('.sticky-column').trigger("sticky_kit:detach");
    },
    scrollIndicator: function () {
        $(window).on('scroll', function () {
            var wintop = $(window).scrollTop(), docheight =
                $(document).height(), winheight = $(window).height();
            var scrolled = (wintop / (docheight - winheight)) * 100;
            $('.scroll-line').css('width', (scrolled + '%'));
        });
  
    },
    parallax: function () {
            //IE, Edge
        var isIE = /MSIE 9/i.test(navigator.userAgent) || /rv:11.0/i.test(navigator.userAgent) || /MSIE 10/i.test(navigator.userAgent) || /Edge\/\d+/.test(navigator.userAgent);

        $('.js-parallax').jarallax({
            disableParallax: function () {
                return isIE
            },
            speed: 0.65,
            type: 'scroll'
        });
    },
    scrollToTop: function () {
        $("#GoTop a").click(function () {
            var _this = $(this);
            $('html,body').animate({ scrollTop: 0 }, 500);
        });
        $(window).on("scroll", function () {
            var fromTop = $(window).scrollTop();
            if (fromTop > 100) {  //判断滚动后高度超过200px,就显示
                $('#GoTop').addClass('btt-visible');
            } else {
                $('#GoTop').removeClass('btt-visible');
            }
        });
  
    },
    mediumZoom: function () {
        const $imgs = $(
            "article img:not([class]),.gallery-grid img,.comment-box__body img"
        );
        if (!$imgs.length) return;
        $imgs.each(function () {
            const $this = $(this);
            $this.addClass("cover lazyload");
            $this.attr("data-zoom", "");
            $this.attr("data-src", `${$this.attr("src")}`);
        });
    
        mediumZoom('[data-zoom]', {
            margin: 30
        });
    },
    Polyfill: function () {
        var $someImages = $('img.cover');
        objectFitImages($someImages);
    },
    Masonry: function () {
        // Portfolio grid row
        var $portfolioMasonry = $('.js-grid-row').isotope({
            itemSelector: '.gallery-grid__item',
            layoutMode: 'fitRows',
            percentPosition: true,
            transitionDuration: '0.5s',
            hiddenStyle: {
                opacity: 0,
                transform: 'scale(0.001)'
            },
            visibleStyle: {
                opacity: 1,
                transform: 'scale(1)'
            },
            fitRows: {
                gutter: '.gutter-sizer'
            },
            masonry: {
                columnWidth: '.gallery-grid__item',
                gutter: '.gutter-sizer',
                isAnimated: true
            }
        });

        $portfolioMasonry.imagesLoaded().progress(function () {
            $portfolioMasonry.isotope({
                columnWidth: '.gallery-grid__item',
                gutter: '.gutter-sizer',
                isAnimated: true,
                layoutMode: 'fitRows',
                fitRows: {
                    gutter: '.gutter-sizer'
                }
            });
        });

        // Portfolio grid irregular
        var $portfolioIrregularMasonry = $('.js-grid').isotope({
            itemSelector: '.gallery-grid__item',
            percentPosition: true,
            transitionDuration: '0.5s',
            hiddenStyle: {
                opacity: 0,
                transform: 'scale(0.001)'
            },
            visibleStyle: {
                opacity: 1,
                transform: 'scale(1)'
            },
            masonry: {
                columnWidth: '.gallery-grid__item',
                gutter: '.gutter-sizer',
                isAnimated: true
            }
        });

        $portfolioIrregularMasonry.imagesLoaded().progress(function () {
            $portfolioIrregularMasonry.isotope({
                columnWidth: '.gallery-grid__item',
                gutter: '.gutter-sizer',
                isAnimated: true
            });
        });
    },
    Tooltip: function () {
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        });
    
    },
    Filter: function () {
        $('.select').on('click', '.placeholder', function () {
            var parent = $(this).closest('.select');
            if (!parent.hasClass('is-open')) {
                parent.addClass('is-open');
                $('.select.is-open').not(parent).removeClass('is-open');
            } else {
                parent.removeClass('is-open');
            }
        }).on('click', 'ul>li', function () {
            var parent = $(this).closest('.select');
            parent.removeClass('is-open').find('.placeholder').text($(this).text());
            parent.find('input[type=hidden]').attr('value', $(this).attr('data-value'));
    
            $('.filter__item').removeClass('active');
            $(this).addClass('active');
            var selector = $(this).attr('data-filter');
    
            $('.js-filter-container').isotope({
                filter: selector
            });
            return false;
        });
    },
    menu_active: function () {
        var url = location.href;
		var urlstatus = false;
		$(".nav li a").each(function () {
			if ((url + '/').indexOf($(this).attr('href')) > -1 && $(this).attr('href') != '/') {
				$(this).addClass('active');
				urlstatus = true;
			} else {
				$(this).removeClass('active');
			}
		});
		if (!urlstatus) {
			$(".nav li a").eq(0).addClass('active');
		}
    },
    Others: function () {
  
    },
  }
  
  
  function PjaxLoad() {
    vCards.preloader();
    vCards.progressBar();
    vCards.LazyLoad();
    vCards.activeStickyKit();
    vCards.detachStickyKit();
    vCards.scrollIndicator();
    vCards.parallax();
    vCards.scrollToTop();
    vCards.mediumZoom();
    vCards.Polyfill();
    vCards.Masonry();
    vCards.Tooltip();
    vCards.Filter();
    vCards.menu_active();
    vCards.Others();

    
    'use strict';

    /*-----------------------------------------------------------------
      Detect device mobile
    -------------------------------------------------------------------*/

    var isMobile = false;
    if (/Android|webOS|iPhone|iPod|iPad|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
        $('html').addClass('touch');
        isMobile = true;
    }
    else {
        $('html').addClass('no-touch');
        isMobile = false;
    }


    /*-----------------------------------------------------------------
      Carousel
    -------------------------------------------------------------------*/

    // Testimonials
    $('.js-carousel-review').each(function () {
        var carousel = new Swiper('.js-carousel-review', {
            slidesPerView: 1,
            spaceBetween: 30,
            speed: 300,
            grabCursor: true,
            watchOverflow: true,
            pagination: {
                el: '.swiper-pagination',
                clickable: true
            },
            autoplay: {
                delay: 5000,
            },
            breakpoints: {
                580: {
                    spaceBetween: 20
                }
            }
        });
    });

    // Clients
    $('.js-carousel-clients').each(function () {
        var carousel = new Swiper('.js-carousel-clients', {
            slidesPerView: 4,
            spaceBetween: 30,
            //loop: true,
            grabCursor: true,
            watchOverflow: true,
            pagination: {
                el: '.swiper-pagination',
                clickable: true
            },
            breakpoints: {
                320: {
                    slidesPerView: 1,
                    spaceBetween: 0
                },
                580: {
                    slidesPerView: 2,
                    spaceBetween: 30
                },
                991: {
                    slidesPerView: 3,
                    spaceBetween: 30
                }
            }
        });
    });



    /*-----------------------------------------------------------------
      Tabs
    -------------------------------------------------------------------*/

    $('.js-tabs').each(function () {
        $('.content .tabcontent').hide();
        $('.content .tabcontent:first').show();
        $('.nav__item a').on('click', function () {
            $('.nav__item a').removeClass('active');
            $(this).addClass('active');
            var currentTab = $(this).attr('href');
            $('.content .tabcontent').hide();
            $(currentTab).show();
            $portfolioMasonry.isotope({
                columnWidth: '.gallery-grid__item',
                gutter: '.gutter-sizer',
                isAnimated: true
            });
            $('.js-scroll').getNiceScroll().resize()
            return false;
        });

        // Mobile close menu
        var screenMobile = 580;

        windowWidth = $(window).width();
        if ((windowWidth < screenMobile)) {
            // autoscroll to content
            $(".nav__item a").click(function (e) {
                e.preventDefault();
                var offset = -35;

                $('html, body').animate({
                    scrollTop: $("#content").offset().top + offset
                }, 0);
            });
        } else {

        }
    });


    
    /*-----------------------------------------------------------------
      Sticky sidebar
    -------------------------------------------------------------------*/

    //  stop sticky kit
    //  based on your window width

    var screen = 1200;

    var windowHeight, windowWidth;
    windowWidth = $(window).width();
    if ((windowWidth < screen)) {
        vCards.detachStickyKit();
    } else {
        vCards.activeStickyKit();
    }

    // windowSize
    // window resize
    function windowSize() {
        windowHeight = window.innerHeight ? window.innerHeight : $(window).height();
        windowWidth = window.innerWidth ? window.innerWidth : $(window).width();
    }
    windowSize();

    function debounce(func, wait, immediate) {
        var timeout;
        return function () {
            var context = this, args = arguments;
            var later = function () {
                timeout = null;
                if (!immediate) func.apply(context, args);
            };
            var callNow = immediate && !timeout;
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
            if (callNow) func.apply(context, args);
        };
    };

    $(window).resize(debounce(function () {
        windowSize();
        $(document.body).trigger("sticky_kit:recalc");
        if (windowWidth < screen) {
            vCards.detachStickyKit();
        } else {
            vCards.activeStickyKit();
        }
    }, 250));
  }
  
  
  $(function() {
    PjaxLoad();
  })
    