<footer class="footer p-3 mt-auto bg-dark">
    <div class="navbar-nav w-100 text-light text-center">
        <div>

            IXP Manager V<?= APPLICATION_VERSION ?>
            |

            <?php if( Auth::check() && Auth::user()->isSuperUser() ): ?>

                Generated in
                <?= sprintf( "%0.3f", microtime(true) - APPLICATION_STARTTIME ) ?>
                seconds

            <?php else: ?>

                Copyright &copy; 2009 - <?php date('Y') ?> Internet Neutral Exchange Association CLG

            <?php endif; ?>

            |

            Discover IXP Manager at:

            <a href="https://www.ixpmanager.org/">
                <i class="fa fa-globe fa-inverse mx-1"></i>
            </a>

            <a href="https://www.facebook.com/ixpmanager">
                <i class="fa fa-facebook fa-inverse mx-1" ></i>
            </a>

            <a  href="https://twitter.com/ixpmanager">
                <i class="fa fa-twitter fa-inverse mx-1"></i>
            </a>

            <a  href="https://github.com/inex/IXP-Manager">
                <i class="fa fa-github fa-inverse mx-1"></i>
            </a>

            <a  href="https://docs.ixpmanager.org/">
                <i class="fa fa-book fa-inverse mx-1"></i>
            </a>


        </div>
    </div>
</footer>
